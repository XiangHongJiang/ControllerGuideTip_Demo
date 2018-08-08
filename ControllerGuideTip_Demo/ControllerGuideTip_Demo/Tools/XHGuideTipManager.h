//
//  XHGuideTipManager.h
//  Test_TouchId
//
//  Created by MrYeL on 2018/8/7.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static const NSString * kTipImageArray = @"tipImageArray";
static const NSString * kTipImageName = @"tipImageName";
static const NSString * kTipImageFrame = @"tipImageFrame";

static const NSString * kTipEmptyRectArray = @"tipEmptyRectArray";
static const NSString * kTipEmptyRect = @"tipEmptyRect";
static const NSString * kTipEmptyRectRadius = @"tipEmptyRectRadius";

@interface XHGuideTipManager : NSObject
/**

 params: {kTipImageArray:@[@{kTipImageName:@"",kTipImageFrame:@()},],kEmptyRectArray:@[@{kTipEmptyRectRadius:@(),kTipEmptyRect:@()},@{kTipEmptyRectRadius:@(),kTipEmptyRect:@()}]}
 
 */
+ (void)showGuideTipViewWithParams:(NSDictionary *)params andBackGroundColor:(UIColor*)bgColor andAnimationTime:(CGFloat)time  andClickAction:(void(^)(NSInteger index))clickBlock;

@end

@interface XHGuideTipView : UIView
/** durationTime*/
@property (nonatomic, assign) CGFloat animationTime;//default : 0.25s
/** desc*/
@property (nonatomic, copy) void(^clickActionBlock)(NSInteger index);
/** 背景图*/
@property (nonatomic, strong,readonly) UIView * bgView;



- (void)configData:(id)data;
- (void)show;
- (void)dismiss;

@end
