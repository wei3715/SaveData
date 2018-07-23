//
//  ZWWStudentDB.h
//  SaveData
//
//  Created by mac on 2018/6/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWWStudentDB : NSObject

//增删改查
+ (BOOL)execSqliteWithSql:(NSString *)sqlStr type:(NSString *)type;

//查
+ (NSArray *)querySqliteWithSql:(NSString *)sqlStr;

@end
