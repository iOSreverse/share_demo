//
//  AppDelegate.m
//  开封网
//
//  Created by wdw on 2020/6/9.
//  Copyright © 2020 wdw. All rights reserved.
//

#import "AppDelegate.h"
#import <MOBFoundation/MobSDK+Privacy.h>
#import <ShareSDK/ShareSDK.h>
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor purpleColor];
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];

    [self initShareSDK];

    return YES;
}

- (void)initShareSDK {
    //用户隐私协议
    [MobSDK getPrivacyPolicy:@"1" language:@"zh" compeletion:^(NSDictionary *_Nullable data, NSError *_Nullable error) {
//        NSLog(@"data-%@", data);
    }];
    [MobSDK uploadPrivacyPermissionStatus:YES onResult:^(BOOL success) {
    }];

    //初始化
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        [platformsRegister setupWeChatWithAppId:@"wx29ab06c527e94b41"
                                      appSecret:@"7a9ac64aa79a5b13f4a3d091cb177dbd"
                                  universalLink:@"https://mkmat.share2dlink.com/"];

//        [platformsRegister setupSinaWeiboWithAppkey:@""
//                                          appSecret:@""
//                                        redirectUrl:@""];

//        [platformsRegister setupQQWithAppId:@"QQ41E35221"
//                                     appkey:@"yvCkgvEAC5J598RN"
//                        enableUniversalLink:NO
//                              universalLink:@""];
    }];
}

@end
