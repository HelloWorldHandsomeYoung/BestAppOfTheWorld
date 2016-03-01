//
//  SGLoginViewController.m
//  NiubilityApp
//
//  Created by 王辉 on 16/3/1.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "SGLoginViewController.h"

@interface SGLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumField;

@property (weak, nonatomic) IBOutlet UITextField *passwardField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *QQButton;
@property (weak, nonatomic) IBOutlet UIButton *weiboButton;
@property (weak, nonatomic) IBOutlet UIButton *WeChatButton;

@end

@implementation SGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"填写手机号";
    self.phoneNumField.keyboardType = UIKeyboardTypeNumberPad;
    self.passwardField.secureTextEntry = YES;
    self.passwardField.clearButtonMode = UITextFieldViewModeAlways;
    self.phoneNumField.clearButtonMode = UITextFieldViewModeAlways;
    
    [self addLeftView];
    [self changeButtonCornerRadius];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}


#pragma mark - 触摸空白处回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.phoneNumField resignFirstResponder];
    [self.passwardField resignFirstResponder];
}

#pragma mark - 登录响应事件
#pragma mark 手机号登录响应事件
- (IBAction)loginAction:(UIButton *)sender {
}

#pragma mark QQ登录响应事件
- (IBAction)loginByQQ:(UIButton *)sender {
}

#pragma mark 新浪登录响应事件
- (IBAction)loginByWeibo:(UIButton *)sender {
}

#pragma mark 微信登录响应事件
- (IBAction)loginByWeChat:(UIButton *)sender {
}


#pragma mark 忘记密码响应时间
- (IBAction)forgetPassward:(UIButton *)sender {
}

#pragma mark - 修改button圆角
- (void)changeButtonCornerRadius {
    self.loginButton.masksToBoundsWH = YES;
    self.loginButton.cornerRadiusWH = 23;
    self.QQButton.masksToBoundsWH = YES;
    self.QQButton.cornerRadiusWH = 25;
    self.weiboButton.masksToBoundsWH = YES;
    self.weiboButton.cornerRadiusWH = 25;
    self.WeChatButton.masksToBoundsWH = YES;
    self.WeChatButton.cornerRadiusWH = 25;
}

#pragma mark 给帐号密码输入框添加左视图
- (void)addLeftView {
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 45)];
    nameLabel.text = @"帐号";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.phoneNumField addSubview:nameLabel];
    self.phoneNumField.leftView = nameLabel;;
    self.phoneNumField.leftViewMode = UITextFieldViewModeAlways;
    
    UILabel *passwardLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 45)];
    passwardLabel.text = @"密码";
    passwardLabel.textAlignment = NSTextAlignmentCenter;
    [self.passwardField addSubview:passwardLabel];
    self.passwardField.leftView = passwardLabel;;
    self.passwardField.leftViewMode = UITextFieldViewModeAlways;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
