//
//  ViewController.m
//  ControllerGuideTip_Demo
//
//  Created by MrYeL on 2018/8/8.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#import "ViewController.h"

#import "GuideTipDemoTableViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel* tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    tipLabel.text = @"点击一下看效果";
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.center = self.view.center;
    [self.view addSubview:tipLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.navigationController pushViewController:[GuideTipDemoTableViewController new] animated:YES];

}


@end
