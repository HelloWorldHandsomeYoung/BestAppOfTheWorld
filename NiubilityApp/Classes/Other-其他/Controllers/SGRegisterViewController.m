//
//  SGRegisterViewController.m
//  NiubilityApp
//
//  Created by lt on 16/3/1.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "SGRegisterViewController.h"

@interface SGRegisterViewController ()<UITextFieldDelegate>

@end

@implementation SGRegisterViewController
-(void)loadView{
    
    [super loadView];
    self.sgrv = [[SGRegisterView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.sgrv;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.sgrv.phoneNum.delegate = self;
    
    [self.sgrv.button addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.sgrv.rightButton addTarget:self action:@selector(sendMessageAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.title = @"填写手机号";
    self.navigationController.navigationBar.backgroundColor = [UIColor yellowColor];
    //实现textField输入改变button状态
    [self.sgrv.phoneNum addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
}
//发送短信按钮响应事件
- (void)sendMessageAction:(UIButton *)sender
{
    sender.selected = YES;
    [sender setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
}
- (void)countDown:(NSTimer *)sender
{
    self.sgrv.rightButton.userInteractionEnabled = NO;
    [self.sgrv.rightButton setTitle:[NSString stringWithFormat:@"%ld s", self.sgrv.rightButton.tag] forState:UIControlStateSelected];
    self.sgrv.rightButton.tag--;
    if (self.sgrv.rightButton.tag == -1) {
        self.sgrv.rightButton.selected = NO;
        [sender invalidate];
        [self.sgrv.rightButton setTitle:@"60 s" forState:UIControlStateSelected];
        [self.sgrv.rightButton setTitle:@"发送" forState:UIControlStateNormal];
        self.sgrv.rightButton.userInteractionEnabled = YES;
        self.sgrv.rightButton.tag = 60;
    }
}

- (void)textFieldChanged:(UITextField *)sender
{
    if (![self.sgrv.phoneNum.text isEqualToString:@""]) {
        self.sgrv.button.userInteractionEnabled = YES;
        self.sgrv.button.alpha = 1;
    }else
    {
        self.sgrv.button.userInteractionEnabled = NO;
        self.sgrv.button.alpha = 0.4;
    }
}
- (void)registerAction:(UIButton *)sender
{
    UIView *view = [[UIView alloc]init];
    view.width = 80;
    view.height = 30;
    view.center = CGPointMake(self.view.centerX, 220);
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.width, view.height)];
    label.text = @"注册成功";
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    
    [self.view addSubview:view];
    [UIView animateWithDuration:1 animations:^{
        view.alpha = 0;
    }];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.sgrv.phoneNum becomeFirstResponder];
    self.sgrv.button.userInteractionEnabled = NO;
    self.sgrv.button.alpha = 0.4;
    self.navigationController.navigationBarHidden = NO;

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
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
