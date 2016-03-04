//
//  HomePageController.m
//  NiubilityApp
//
//  Created by 吕阳 on 16/3/1.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "HomePageController.h"
#import "HotViewController.h"
#import "NewViewController.h"
#import "NearViewController.h"
#import "UserManager.h"

@interface HomePageController ()<UIScrollViewDelegate, AVIMClientDelegate>
/* 标签栏底部的红色指示器 */
@property (nonatomic, weak)UIView  *indicatorView;
/* 当前选中的按钮  */
@property (nonatomic, weak)UIButton  *selectedButton;
/* 顶部所有标签*/
@property (nonatomic, weak)UIView  *titlesView;
/* 中间所有内容*/
@property (nonatomic, weak)UIScrollView  *contentView;
@end
//static  NSString *cellID = @"HomeCell";
@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化Navigation
    [self setupNavigation];
    //添加子控制器
    [self setupChildVcs];
    //底部的scrollView
    [self setupContentView];
    
    //设置消息代理
    [UserManager shareInstance].client.delegate = self;
}
#pragma mark - AVIMClientDelegate
- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message
{
    NSLog(@"%@", message.text);
}
#pragma mark - 设置Navigation
- (void)setupNavigation
{
    
    UIView *titlesView = [[UIView alloc]init];
//    titlesView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7];
    titlesView.width = 210;
    titlesView.height = 44;
    titlesView.y = 0;
    titlesView.centerX = self.view.centerX;
    self.titlesView = titlesView;
    self.navigationItem.titleView = self.titlesView ;
    
    //底部的指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = titlesView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    
    //内部的子标签
    NSArray *titles = @[@"热门", @"附近", @"最新"];
    NSInteger count = 3;
    CGFloat width = titlesView.width / count;
    CGFloat height = titlesView.height;
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.width = width;
        button.height = height;
        button.x = i * width;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        //        [button layoutIfNeeded];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
        //默认点击了第一个按钮
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
            //让按钮内部的label根据内容设置尺寸
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
            
        }
    }
    [titlesView addSubview:indicatorView];
}

//titlesView按钮点击事件
- (void)titleClick:(UIButton *)button
{
    //修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    //动画
    [UIView animateWithDuration:0.5 animations:^{
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];
    //滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

#pragma mark - 添加子控制器
- (void)setupChildVcs
{
    //热门
    HotViewController *hot = [[HotViewController alloc]init];
    hot.tableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    [self addChildViewController:hot];
    //附近
    NearViewController *near = [[NearViewController alloc]init];
    [self addChildViewController:near];
    //最新
    NewViewController *new = [[NewViewController alloc]init];
    [self addChildViewController:new];
    
    
}
#pragma mark - 初始化底部scrollView
- (void)setupContentView
{
    //取消自动
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
    contentView.frame = self.view.bounds;
    NSLog(@"%zd", self.childViewControllers.count);
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    self.contentView = contentView;
    self.contentView.backgroundColor = [UIColor clearColor];
    //添加第一个控制器的View
    [self scrollViewDidEndScrollingAnimation:contentView];
}
#pragma mark - ScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //添加子控制器的View
    
    //当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    //取出子控制器
    UITableViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;//设置控制器view的y值，默认为20
    vc.view.height = scrollView.height;
    [scrollView addSubview:vc.view];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
}
@end
