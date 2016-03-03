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
    self.backgroundColor = [UIColor whiteColor];
    //第一个textfield以及左右辅助视图
    self.country = [[UITextField alloc]initWithFrame:CGRectMake(0, 70, self.width, 45)];
    self.country.backgroundColor = [UIColor whiteColor];
    UILabel *leftViewC = [[UILabel alloc]init];
    leftViewC.size = CGSizeMake(100, 45);
    leftViewC.text = @"国家或地区";
    leftViewC.textColor = [UIColor grayColor];
    self.country.leftView = leftViewC;
    self.country.leftViewMode = UITextFieldViewModeAlways;
    
    UILabel *rightViewC = [[UILabel alloc]init];
    rightViewC.size = CGSizeMake(60, 45);
    rightViewC.textColor = [UIColor grayColor];
    rightViewC.text = @"中国";
    self.country.rightView = rightViewC;
    self.country.rightViewMode = UITextFieldViewModeAlways;
    self.country.userInteractionEnabled = NO;
    
    [self addSubview:self.country];
    
    CGSize sizeB = CGSizeMake(60, 45);
    self.phoneNum = [[UITextField alloc]initWithFrame:CGRectMake(0, 115, self.width, 45)];
    UILabel *leftViewP = [[UILabel alloc]init];
    leftViewP.size = sizeB;
    leftViewP.text = @"+86";
    leftViewP.textColor = [UIColor grayColor];
    self.phoneNum.leftView = leftViewP;
    self.phoneNum.leftViewMode = UITextFieldViewModeAlways;
    self.phoneNum.placeholder = @"请输入手机号码";
    self.phoneNum.backgroundColor = [UIColor whiteColor];
    self.phoneNum.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:self.phoneNum];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.size = sizeB;
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [rightButton setTitle:@"发送" forState:UIControlStateNormal];
    rightButton.tag = 60;
    self.rightButton = rightButton;
    self.phoneNum.rightView = rightButton;
    self.phoneNum.rightViewMode = UITextFieldViewModeAlways;
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(0, 0, 230, 45);
    self.button.center = CGPointMake(self.centerX, 290);
    [self.button setTitle:@"注册" forState:UIControlStateNormal];
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 23;
    self.button.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.button];
    
    
    //分隔线
    [self addSeparator:self.country frame:CGRectMake(0, 0, self.width, 1)];
    
    [self addSeparator:self.phoneNum frame:CGRectMake(0, 0, self.width, 1)];
    
    [self addSeparator:self.phoneNum frame:CGRectMake(0, 44, self.width, 1)];
    
}
- (void)addSeparator:(UIView *)view frame: (CGRect )frame
{
    UIView *separator = [[UIView alloc]init];
    separator.frame = frame;
    separator.backgroundColor = [UIColor grayColor];
    separator.alpha = 0.4;
    [view addSubview:separator];
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
