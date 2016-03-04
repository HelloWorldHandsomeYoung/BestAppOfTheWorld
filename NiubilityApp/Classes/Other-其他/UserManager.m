//
//  UserManager.m
//  NiubilityApp
//
//  Created by 吕阳 on 16/3/3.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "UserManager.h"

static UserManager *manager = nil;
@implementation UserManager
//单例
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UserManager alloc]init];
        
    });
    return manager;
}
//用户注册
- (AVObject *)userRegisterWithUserName:(NSString *)userName PassWord:(NSString *)passWord Gender:(NSString *)gender NickName:(NSString *)nickName
{
    AVObject *user = [AVObject objectWithClassName:@"User_Info"];
    [user setObject:userName forKey:@"userName"];
    [user setObject:passWord forKey:@"passWord"];
    [user setObject:gender   forKey:@"gender"];
    [user setObject:nickName forKey:@"nickName"];
    
    return user;
}
//用户登录（查询）
- (AVObject *)userLoginWithUserName:(NSString *)userName
                           PassWord:(NSString *)passWord
{
    self.user = [[AVObject alloc]init];
    AVQuery *query = [AVQuery queryWithClassName:@"User_Info"];
    [query whereKey:@"userName" equalTo:userName];
    [query whereKey:@"passWord" equalTo:passWord];
    
    self.user = [[query findObjects] firstObject];
    
    return self.user;
}

//开启AVIMConversation
- (void)startClient
{
    self.client = [[AVIMClient alloc]initWithClientId:self.user[@"nickName"]];
    //打开client通道
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        
    }];
}
//发送消息
- (void)sendMessageTo:(NSString *)nickName Message:(NSString *)message
{
    //打开会话
    [[UserManager shareInstance].client openWithCallback:^(BOOL succeeded, NSError *error) {
        [self.client createConversationWithName:nickName clientIds:@[nickName] callback:^(AVIMConversation *conversation, NSError *error) {
            [conversation sendMessage:[AVIMTextMessage messageWithText:message attributes:nil] callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"1");
                }
            }];
        }];
    }];
}
@end
