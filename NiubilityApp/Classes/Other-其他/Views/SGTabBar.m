//
//  SGTabBar.m
//  NiubilityApp
//
//  Created by 吕阳 on 16/3/1.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "SGTabBar.h"

@interface SGTabBar ()
@property (nonatomic, weak)UIButton *publishButton;
@end

@implementation SGTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置tabBar背景颜色
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        //添加发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        publishButton.size = publishButton.currentBackgroundImage.size;
        self.publishButton = publishButton;
        [self addSubview:self.publishButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    //设置发布按钮 设置tabBarItem位置
    //    self.publishButton.size = self.publishButton.currentBackgroundImage.size;
    self.publishButton.center = CGPointMake(width * 0.5 , height * 0.5);
    CGFloat buttonW = width / 3;
    CGFloat buttonH = height;
    CGFloat buttonY = 0;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        //        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
        //            continue;
        //        }
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) {
            continue;
        }
        //计算按钮的X值
        CGFloat buttonX = buttonW * ((index > 0) ? (index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //增加索引
        index++;
    }
}

@end
