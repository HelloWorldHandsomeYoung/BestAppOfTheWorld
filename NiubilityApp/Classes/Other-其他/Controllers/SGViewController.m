//
//  SGViewController.m
//  NiubilityApp
//
//  Created by 吕阳 on 16/3/1.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "SGViewController.h"
#import "SGNavigationController.h"
#import "HomePageController.h"
#import "MeController.h"
#import "SGTabBar.h"


@interface SGViewController ()

@end

@implementation SGViewController
+ (void)initialize
{
    //通过appearance统一设置
    NSMutableDictionary *atts = [NSMutableDictionary dictionary];
    atts[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    atts[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAtts = [NSMutableDictionary dictionary];
    selectedAtts[NSFontAttributeName] = atts[NSFontAttributeName];
    selectedAtts[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAtts forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVC:[[HomePageController alloc]init] title:@"主页" img:@"tabBar_essence_icon" selectedImg:@"tabBar_essence_click_icon"];
    
    [self setupChildVC:[[MeController alloc]init] title:@"我" img:@"tabBar_me_icon" selectedImg:@"tabBar_me_click_icon"];
    
    [self setValue:[[SGTabBar alloc]init] forKey:@"tabBar"];
    
}
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title img:(NSString *)img selectedImg:(NSString *)SeletedImg
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:img];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:SeletedImg];
    
    SGNavigationController *nvc = [[SGNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nvc];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
