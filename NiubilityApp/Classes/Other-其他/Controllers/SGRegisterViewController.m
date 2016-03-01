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
    
    self.navigationItem.title = @"填写手机号";
    self.navigationController.navigationBar.backgroundColor = [UIColor yellowColor];
    //实现textField输入改变button状态
    [self.sgrv.phoneNum addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
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
    NSLog(@"1");
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
