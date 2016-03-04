//
//  ChatViewController.m
//  NiubilityApp
//
//  Created by 吕阳 on 16/3/4.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "ChatViewController.h"
#import "UserManager.h"

@interface ChatViewController ()<UITextFieldDelegate, AVIMClientDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *chatTable;
@property (weak, nonatomic) IBOutlet UITextField *textField;
/* conversation */
@property (nonatomic, strong)AVIMConversation *conversation;
/* 聊天记录 */
@property (nonatomic, strong)NSMutableArray *chatData;

@end

static NSString *cellID = @"chatID";
@implementation ChatViewController
//懒加载
- (NSMutableArray *)chatData
{
    if (!_chatData) {
        _chatData = [NSMutableArray array];
    }
    return _chatData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //背景颜色
    self.view.backgroundColor = [UIColor colorWithRed:0.99 green:0.51 blue:0.27 alpha:1];
    //设置通知
    [self getNotification];
    
    //设置Navigation
    [self setupNavigation];
    
    //添加键盘回弹手势
    [self setupUITap];
    
    //设置消息代理
    [UserManager shareInstance].client.delegate = self;
    
    //设置代理
    self.textField.delegate = self;
    
    self.chatTable.delegate = self;
    self.chatTable.dataSource = self;
    //注册
    [self.chatTable registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    //登录
    [[UserManager shareInstance]userLoginWithUserName:@"2" PassWord:@"2"];
    //开启客户端
    [[UserManager shareInstance]startClient];
    
}
#pragma mark - AVIMClientDelegate
- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message
{
    [self.chatData addObject:message];
    self.conversation = conversation;
    
    [self.chatTable reloadData];
    
}
#pragma mark - textFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
//    [[UserManager shareInstance]sendMessageTo:@"b" Message:textField.text];
    AVIMTextMessage *reply = [AVIMTextMessage messageWithText:self.textField.text attributes:nil];
    [self.chatData addObject:reply];
    
    if (self.conversation != NULL) {
        [self.conversation sendMessage:reply callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"回复成功！");
            }
            NSLog(@"%@", error);
        }];
    }
    else
    {
    [[UserManager shareInstance].client createConversationWithName:@"test" clientIds:@[@"b"] callback:^(AVIMConversation *conversation, NSError *error) {
        NSLog(@"%@", error);
        [conversation sendMessage:reply callback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"回复成功！");
                
            }
            NSLog(@"%@", error);
        }];
    }];
    }
    self.textField.text = nil;
    return YES;
}
#pragma mark - 键盘回弹手势
- (void)setupUITap
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.chatTable addGestureRecognizer:tap];
}
- (void)tapAction:(UITapGestureRecognizer *)sender
{
    [self.textField endEditing:YES];
}
#pragma mark - 设置Navigation
- (void)setupNavigation
{
    self.navigationItem.title = @"b";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.99 green:0.51 blue:0.27 alpha:1];
}
#pragma mark - 创建通知
- (void)getNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark - 计算键盘高度
- (CGFloat)keyboardEnditingFrameHeight:(NSDictionary *)info
{
    CGRect keyboardEnditingUncorrectedFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGRect keyboardEnditingFrame = [self.view convertRect:keyboardEnditingUncorrectedFrame fromView:nil];
    return keyboardEnditingFrame.size.height;
}
#pragma mark - 通知消息

- (void)keyboardWillAppear:(NSNotification *)notification
{
    self.view.y = 0;
    CGRect currentFrame = self.view.frame;
    CGFloat change = [self keyboardEnditingFrameHeight:[notification userInfo]];
    currentFrame.origin.y = currentFrame.origin.y - change ;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = currentFrame;
    }];
}

- (void)keyboardWillDisappear:(NSNotification *)notification
{
    CGRect currentFrame = self.view.frame;
    CGFloat change = [self keyboardEnditingFrameHeight:[notification userInfo]];
    currentFrame.origin.y = currentFrame.origin.y + change ;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = currentFrame;
    }];
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.chatData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    AVIMTextMessage *text = self.chatData[indexPath.row];
    if ([text.clientId isEqualToString:[UserManager shareInstance].user[@"nickName"]]) {
        cell.textLabel.textAlignment = NSTextAlignmentRight;
        
    }else
    {
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
    cell.textLabel.text = text.text;
    return cell;
}
@end
