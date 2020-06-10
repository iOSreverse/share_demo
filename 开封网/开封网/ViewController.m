//
//  ViewController.m
//  开封网
//
//  Created by wdw on 2020/6/9.
//  Copyright © 2020 wdw. All rights reserved.
//

#import "ViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.shareBtn.frame = CGRectMake(100, 100, 50, 30);
    self.loginBtn.frame = CGRectMake(100, 300, 50, 30);
}

#pragma mark - 点击事件
//分享
- (void)shareBtnClick
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params SSDKSetupShareParamsByText:@"test"
                                images:@"http://download.sdk.mob.com/web/images/2019/07/30/14/1564468183056/750_750_65.12.png"
                                   url:[NSURL URLWithString:@"http://www.mob.com/"]
                                 title:@"title"
                        type:SSDKContentTypeAuto];

    [ShareSDK showShareActionSheet:nil //(第一个参数要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，在ipad中要想弹出我们的分享菜单，这个参数必须要传值，可以传自己分享按钮的对象，或者可以创建一个小的view对象去传，传值与否不影响iphone显示)
                     customItems:nil
                     shareParams:params
              sheetConfiguration:nil
                  onStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType,NSDictionary *userData,SSDKContentEntity *contentEntity,NSError *error,BOOL end)
             {
    switch (state) {
                 case SSDKResponseStateSuccess:
                         NSLog(@"成功");//成功
                         break;
                 case SSDKResponseStateFail:
                    {
                         NSLog(@"--%@",error.description);//失败
                         break;
                    }
                 case SSDKResponseStateCancel:
                 break;
                 default:
                 break;
             }
    }];
}

//登录
- (void)loginBtnClick
{
    [ShareSDK authorize:SSDKPlatformTypeWechat
                        settings:nil
            onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               switch (state) {
                        case SSDKResponseStateSuccess:
                                 NSLog(@"%@",[user.credential rawData]);
                        break;
                        case SSDKResponseStateFail:
                              {
                                 NSLog(@"--%@",error.description);
                                 //失败
                                 break;
                               }
                        case SSDKResponseStateCancel:
                                 //用户取消授权
                                 break;

                        default:
                        break;
            }
    }];
    
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
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginBtn];
    }
    return _loginBtn;
}

@end
