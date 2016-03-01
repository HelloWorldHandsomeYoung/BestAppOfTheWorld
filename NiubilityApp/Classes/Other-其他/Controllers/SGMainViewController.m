//
//  SGMainViewController.m
//  NiubilityApp
//
//  Created by 王辉 on 16/3/1.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "SGMainViewController.h"
#import "SGLoginViewController.h"

@interface SGMainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation SGMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    [self changeButtonCornerRadius];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - 改变button圆角
- (void)changeButtonCornerRadius {
    self.registerButton.layer.masksToBounds = YES;
    self.registerButton.layer.cornerRadius = 5;
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 5;
}

#pragma mark - 注册响应方法
- (IBAction)registerAction:(UIButton *)sender {
}

#pragma mark - 登录响应方法
- (IBAction)loginAction:(UIButton *)sender {
//    UINavigationController *smvc = [[UINavigationController alloc] init];
    SGLoginViewController *nvc = [[SGLoginViewController alloc] init];

    [self.navigationController pushViewController:nvc animated:YES];

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
