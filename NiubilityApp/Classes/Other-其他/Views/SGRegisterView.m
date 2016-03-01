//
//  SGRegisterView.m
//  NiubilityApp
//
//  Created by lt on 16/3/1.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "SGRegisterView.h"

@implementation SGRegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    //第一个textfield以及左右辅助视图
    self.country = [[UITextField alloc]initWithFrame:CGRectMake(0, 40, self.width, 45)];
    self.country.backgroundColor = [UIColor grayColor];
    UILabel *leftViewC = [[UILabel alloc]init];
    leftViewC.size = CGSizeMake(100, 45);
    leftViewC.text = @"国家或地区";
    self.country.leftView = leftViewC;
    self.country.leftViewMode = UITextFieldViewModeAlways;
    
    UILabel *rightViewC = [[UILabel alloc]init];
    rightViewC.size = CGSizeMake(60, 45);
    rightViewC.text = @"中国";
    self.country.rightView = rightViewC;
    self.country.rightViewMode = UITextFieldViewModeAlways;
    self.country.userInteractionEnabled = NO;
    
    [self addSubview:self.country];
    
    self.phoneNum = [[UITextField alloc]initWithFrame:CGRectMake(0, 110, self.width, 45)];
    UILabel *leftViewP = [[UILabel alloc]init];
    leftViewP.size = CGSizeMake(60, 45);
    leftViewP.text = @"+86";
    self.phoneNum.leftView = leftViewP;
    self.phoneNum.leftViewMode = UITextFieldViewModeAlways;
    self.phoneNum.placeholder = @"请输入手机号码";
    self.phoneNum.backgroundColor = [UIColor grayColor];
    self.phoneNum.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:self.phoneNum];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(0, 0, 230, 45);
    self.button.center = CGPointMake(self.centerX, 260);
    [self.button setTitle:@"注册" forState:UIControlStateNormal];
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 23;
    self.button.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.button];
    
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
