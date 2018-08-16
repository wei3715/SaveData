//
//  AppDelegate+method.m
//  SaveData
//
//  Created by mac on 2018/8/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AppDelegate+method.h"
#import "KeychainManager.h"
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@implementation AppDelegate (method)
- (void)saveAppInfo{
    KeychainManager *manager = [KeychainManager default];
    NSString *data = [manager load:@"myName"];
    if (data == nil) {
        NSLog(@"Save");
        NSString *dataString = @"我是谁";
        [manager save:@"myName" data:dataString];
    }
    NSLog(@"data = %@",data);
}

@end
