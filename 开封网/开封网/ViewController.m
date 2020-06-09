//
//  ViewController.m
//  开封网
//
//  Created by wdw on 2020/6/9.
//  Copyright © 2020 wdw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/**
 分享
 */
@property (nonatomic, strong) UIButton *shareBtn;

/**
 登录
 */
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI {
    self.shareBtn.frame = CGRectMake(100, 100, 50, 30);
    self.loginBtn.frame = CGRectMake(100, 300, 50, 30);
}

#pragma mark - 点击事件
- (void)shareBtnClick
{
    
}

- (void)loginBtnClick
{
    
}

#pragma mark - 懒加载
- (UIButton *)shareBtn {
    if (_shareBtn == nil) {
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        [_shareBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_shareBtn];
    }
    return _shareBtn;
}

- (UIButton *)loginBtn {
    if (_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginBtn];
    }
    return _loginBtn;
}

@end
