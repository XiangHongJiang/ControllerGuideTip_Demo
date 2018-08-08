//
//  GuideTipDemoTableViewController.m
//  ControllerGuideTip_Demo
//
//  Created by MrYeL on 2018/8/8.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#import "GuideTipDemoTableViewController.h"

#import "XHGuideTipManager.h"



@interface GuideTipDemoTableViewController ()

/** 数据Array*/
@property (nonatomic, copy) NSArray * dataArray;

@end

@implementation GuideTipDemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"使用提示";
    
    self.dataArray = @[@"点击显示",@"显示一个，再来一个",@"全图覆盖",@"不带穿刺框"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    headerView.backgroundColor = [UIColor yellowColor];
    self.tableView.tableHeaderView = headerView;
    self.tableView.tableFooterView = [UIView new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    switch (indexPath.row) {
        case 0://点击显示
            [self showDefault];
            break;
        case 1://显示一个，再来一个
            [self showNext];
            break;
        case 2://全图覆盖
            [self showAllPic];
            break;
        case 3://不带穿透框
            [self showNoEmpty];
            break;
            
        default:
            break;
    }
}

#pragma mark - Action
- (void)showDefault {
    NSDictionary *parmas= @{
                            kTipImageArray:
  @[
  @{kTipImageName:@"button_Iknow",
    kTipImageFrame:@(CGRectMake(kScreenWidth *0.5 - 54, kScreenHeight - 60 - 50, 108, 60))},
  @{kTipImageName:@"guide_add",
    kTipImageFrame:@(CGRectMake(kScreenWidth - 223.5 -15, NAVIGATION_BAR_HEIGHT + 110 + 15, 223.5, 123.5))}
    ],
                            kTipEmptyRectArray:
  @[
  @{
    kTipEmptyRect:@(CGRectMake(15, NAVIGATION_BAR_HEIGHT + 15, kScreenWidth - 30, 50)),
    kTipEmptyRectRadius:@(4)}
    ]
                            };
    
    
    [XHGuideTipManager showGuideTipViewWithParams:parmas andBackGroundColor:nil andAnimationTime:0.25 andClickAction:^(NSInteger index) {

        NSLog(@"点了图:%ld",index);
    }];

    
}

- (void)showNext{
    __weak typeof(self) weakSelf = self;
    
   NSDictionary * parmas = @{
                             kTipImageArray:
  @[
  @{kTipImageName:@"button_Iknow",
    kTipImageFrame:@(CGRectMake(kScreenWidth *0.5 - 54, kScreenHeight - 60 - 50, 108, 60))},
  @{kTipImageName:@"guide_add",
    kTipImageFrame:@(CGRectMake(kScreenWidth - 223.5 - 50, NAVIGATION_BAR_HEIGHT + 110 + 50, 223.5, 123.5))}
  ],
                             kTipEmptyRectArray:
  @[
  @{kTipEmptyRect:@(CGRectMake(15, NAVIGATION_BAR_HEIGHT + 15, 50, 50)),
    kTipEmptyRectRadius:@(25)},
  @{kTipEmptyRect:@(CGRectMake(kScreenWidth - 50 - 15, NAVIGATION_BAR_HEIGHT + 15, 50, 50)),
    kTipEmptyRectRadius:@(25)},
  
  ]
               };

    [XHGuideTipManager showGuideTipViewWithParams:parmas andBackGroundColor:nil andAnimationTime:0.1 andClickAction:^(NSInteger index) {

        [weakSelf showDefault];
        NSLog(@"点了图:%ld",index);

    }];
    
}
- (void)showAllPic {//IPHONEX下的全图，需要额外制作，因为导航高度不同
    NSDictionary * parmas = @{
                              kTipImageArray:
  @[
                                      @{kTipImageName:iPhoneX?@"guide_add":@"button_Iknow",
    kTipImageFrame:@(CGRectMake(0, 0, kScreenWidth, kScreenHeight))
    
    },
  ]
                               };
    
    [XHGuideTipManager showGuideTipViewWithParams:parmas andBackGroundColor:nil andAnimationTime:0.25 andClickAction:^(NSInteger index) {
        NSLog(@"点了图:%ld",index);

        
    }];
}
- (void)showNoEmpty {
    NSDictionary *parmas= @{
                            kTipImageArray:
                                @[
                                    @{kTipImageName:@"button_Iknow",
                                      kTipImageFrame:@(CGRectMake(kScreenWidth *0.5 - 54, kScreenHeight - 60 - 50, 108, 60))},
                                    @{kTipImageName:@"guide_add",
                                      kTipImageFrame:@(CGRectMake(kScreenWidth - 223.5 -15, NAVIGATION_BAR_HEIGHT + 110 + 15, 223.5, 123.5))}
                                    ]
                            };
    
    [XHGuideTipManager showGuideTipViewWithParams:parmas andBackGroundColor:nil andAnimationTime:0.25 andClickAction:^(NSInteger index) {
        NSLog(@"点了图:%ld",index);

    }];

    
}



@end
