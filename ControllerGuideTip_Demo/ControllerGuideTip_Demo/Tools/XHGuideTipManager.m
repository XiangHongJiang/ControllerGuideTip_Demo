//
//  XHGuideTipManager.m
//  Test_TouchId
//
//  Created by MrYeL on 2018/8/7.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#import "XHGuideTipManager.h"

#define GuideDefaultTag 10000

@implementation XHGuideTipManager

+ (void)showGuideTipViewWithParams:(NSDictionary *)params andBackGroundColor:(UIColor*)bgColor andAnimationTime:(CGFloat)time  andClickAction:(void(^)(NSInteger index))clickBlock{

    XHGuideTipView *view = [XHGuideTipView new];
    view.clickActionBlock = clickBlock;
    view.animationTime = time;
    [view configData:params];
    if (bgColor && [bgColor isKindOfClass:[UIColor class]]) {
        view.bgView.backgroundColor = bgColor;
    }
    
    [view show];
}

@end


@interface XHGuideTipView()

@end

@implementation XHGuideTipView
@synthesize bgView = _bgView;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.animationTime = 0.25;
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [self addSubview:bgView];
        bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _bgView = bgView;
        
    }
    return self;
}

#pragma mark - Setter and Getter
- (void)configData:(NSDictionary *)data {
    
    if ([data isKindOfClass:[NSDictionary class]]) {
        
        //0.添加空白穿刺
        NSArray *emptyRectArray = data[kTipEmptyRectArray];
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];

        for (int i = 0; i < emptyRectArray.count ; i ++) {
            
            NSDictionary *dict = emptyRectArray[i];
            CGRect emptyRect = [dict[kTipEmptyRect] CGRectValue];
            CGFloat radius = [dict[kTipEmptyRectRadius] floatValue];
            [path appendPath: [[UIBezierPath bezierPathWithRoundedRect:emptyRect cornerRadius:radius>0?radius:4] bezierPathByReversingPath]];
        }
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        self.layer.mask = shapeLayer;
        
        //1.添加图片
        NSArray *imageDictArray = data[kTipImageArray];
        for (int i = 0; i < imageDictArray.count; i++) {
            
            NSDictionary *dict = imageDictArray[i];
            NSString *imageName = dict[kTipImageName];
            CGRect imageRect = [dict[kTipImageFrame] CGRectValue];
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageRect];
            [self addSubview:imageView];
            imageView.image = [UIImage imageNamed:imageName];
            
            imageView.tag = i + GuideDefaultTag;
            //2.添加点击
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] init];
            [tapGR addTarget:self action:@selector(tagAction:)];
            [imageView addGestureRecognizer:tapGR];
        }
        
     
        
    }
    
    
}
#pragma mark - Action
- (void)tagAction:(UITapGestureRecognizer *)tapGR {
    
    UIView *view = tapGR.view;
    if (self.clickActionBlock) {
        self.clickActionBlock(view.tag - GuideDefaultTag);
    }
    [self dismiss];
    
}
- (void)show {
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
}
- (void)dismiss {
    
    [UIView animateWithDuration:self.animationTime animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];

    }];
}


@end
