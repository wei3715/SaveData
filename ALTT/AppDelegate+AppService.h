//
//  AppDelegate+AppService.h
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)

//初始化 window
-(void)initWindow;

//单例
+ (AppDelegate *)shareAppDelegate;

//键盘监听
- (void)initKeyboard;

/**
 当前顶层控制器
 */
-(UIViewController*) getCurrentVC;

-(UIViewController*) getCurrentUIVC;

@end
