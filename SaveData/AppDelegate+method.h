//
//  AppDelegate+method.h
//  SaveData
//
//  Created by mac on 2018/8/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (method)

//使用钥匙串keychain实现，卸载App后仍可记录App信息
- (void)saveAppInfo;
@end
