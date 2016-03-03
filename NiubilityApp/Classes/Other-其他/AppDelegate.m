//
//  AppDelegate.m
//  NiubilityApp
//
//  Created by 吕阳 on 16/2/29.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageController.h"
#import "SGViewController.h"
#import "SGMainViewController.h"
#import "SGNavigationController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
//微信SDK头文件
#import "WXApi.h"
//新浪微博SDK头文件
#import "WeiboSDK.h"

#import "UserManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self thirdLogin];
    
    [self leanCloudInfo];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    SGNavigationController *nvc = [[SGNavigationController alloc] initWithRootViewController:[[SGMainViewController alloc]init]];

    self.window.rootViewController = nvc;
    
//    [nvc pushViewController:[[SGViewController alloc]init] animated:YES];
    
//    AVObject * user = [[UserManager shareInstance]userRegisterWithUserName:@"1" PassWord:@"1" Gender:@"man" NickName:@"a"];
//    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            NSLog(@"1");
//        }
//    }];
    
    
    return YES;
}
#pragma mark - LeanCloud 配置
- (void)leanCloudInfo
{
    // applicationId 即 App Id，clientKey 是 App Key。
    [AVOSCloud setApplicationId:@"DvA9uJXUwBf2CMAAsaw8kUsQ-gzGzoHsz"
                      clientKey:@"wXBe53WFmxWujK1nywefRtpD"];
}
#pragma mark - 第三方登录配置
- (void)thirdLogin
{
    //ShareSDK 第三方登录 配置
    NSArray *platform = @[@(SSDKPlatformTypeSinaWeibo), @(SSDKPlatformTypeQQ), @(SSDKPlatformTypeWechat)];
    
    [ShareSDK registerApp:@"Niubility" activePlatforms:platform onImport:^(SSDKPlatformType platformType) {
        switch (platformType) {
            case SSDKPlatformTypeWechat:
                [ShareSDKConnector connectWeChat:[WXApi class]];
                break;
            case SSDKPlatformTypeQQ:
                [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                break;
            case SSDKPlatformTypeSinaWeibo:
                [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                break;
            default:
                break;
        }
    } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
        switch (platformType) {
            case SSDKPlatformTypeSinaWeibo:
                [appInfo SSDKSetupSinaWeiboByAppKey:@"645305919" appSecret:@"cf4c6578515b3a3c417ddd62243ac9e7" redirectUri:@"http://www.sharesdk.cn" authType:SSDKAuthTypeBoth];
                break;
            case SSDKPlatformTypeWechat:
                [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                break;
            case SSDKPlatformTypeQQ:
                [appInfo SSDKSetupQQByAppId:@"1105217706"appKey:@"dcQTMYNUBPYWMfPj"authType:SSDKAuthTypeBoth];
                break;
            default:
                break;
        }
    }];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
