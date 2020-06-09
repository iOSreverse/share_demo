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

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initShareSDK];

    return YES;
}

- (void)initShareSDK {
    //用户隐私协议
    [MobSDK getPrivacyPolicy:@"1" language:@"zh" compeletion:^(NSDictionary *_Nullable data, NSError *_Nullable error) {
        NSLog(@"data-%@", data);
    }];
    [MobSDK uploadPrivacyPermissionStatus:YES onResult:^(BOOL success) {
    }];

    //初始化
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        [platformsRegister setupWeChatWithAppId:@"wx01c6586fd0240a2e"
                                      appSecret:@"b2a8f1a6a71291b505ebb46f099fc29e"
                                  universalLink:@""];

        [platformsRegister setupSinaWeiboWithAppkey:@""
                                          appSecret:@""
                                        redirectUrl:@""];

        [platformsRegister setupQQWithAppId:@"QQ41E35221"
                                     appkey:@"yvCkgvEAC5J598RN"
                        enableUniversalLink:NO
                              universalLink:@""];
    }];
}

#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

@end
