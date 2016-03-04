//
//  UserManager.h
//  NiubilityApp
//
//  Created by 吕阳 on 16/3/3.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject
/* User */
@property (nonatomic, strong)AVObject *user;
/* Client */
@property (nonatomic, strong)AVIMClient *client;
//单例
+ (instancetype)shareInstance;
//用户注册
- (AVObject *)userRegisterWithUserName:(NSString *)userName
                        PassWord:(NSString *)passWord
                          Gender:(NSString *)gender
                        NickName:(NSString *)nickName;
//用户登录（查询）
- (AVObject *)userLoginWithUserName:(NSString *)userName
                           PassWord:(NSString *)passWord;

//开启AVIMConversation
- (void)startClient;
//发送消息
- (void)sendMessageTo:(NSString *)nickName Message:(NSString *)message;
@end
