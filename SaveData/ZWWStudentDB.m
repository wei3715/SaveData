//
//  ZWWStudentDB.m
//  SaveData
//
//  Created by mac on 2018/6/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWStudentDB.h"
#import "NSString+CachePath.h"
#import <sqlite3.h>
#import "Student.h"

static NSString  *fileName = nil;
static sqlite3   *dataBase = nil;

@implementation ZWWStudentDB

//因为是类方法，所以要使用initialize初始化而不是init实例方法
+ (void)initialize{

    //创建数据库路径
    fileName = [NSString cachePathWithFileName:@"newSqlite.sqlite"];
    ZWWLog(@"数据库路径==%@",fileName);
    
    //打开数据库：如果没有数据库则创建数据库，有数据库则打开数据库
    //agr1:数据库地址
    //sqlite3 **ppDb:数据库指针地址
    if (sqlite3_open(fileName.UTF8String, &dataBase) == SQLITE_OK) {
        ZWWLog(@"打开数据库成功");
        
        //创建表
        NSString *sqlStr = @"create table if not exists t_student (id integer primary key autoincrement, name text, age integer) ";
        //执行SQL语句
        //sqlite3 *:数据库地址
        //agr2:sql语句
        char *error = nil;
        sqlite3_exec(dataBase, sqlStr.UTF8String,NULL, NULL, &error);
        if (error) {
            ZWWLog(@"创建表失败%s",error);
        } else {
            ZWWLog(@"创建表成功");
        }
        
    } else {
        ZWWLog(@"打开数据库失败");
    }
}

+ (BOOL)execSqliteWithSql:(NSString *)sqlStr type:(NSString *)type{
    char *errorMsg = nil;
    //打开数据库
    if (sqlite3_open(fileName.UTF8String, &dataBase) == SQLITE_OK) {
        //执行sql语句
        sqlite3_exec(dataBase, sqlStr.UTF8String, NULL, NULL, &errorMsg);
        //关闭数据库
        sqlite3_close(dataBase);
        if (errorMsg) {
            ZWWLog(@"%@失败%s",type,errorMsg);
        } else {
            ZWWLog(@"%@成功",type);
        }
    } else {
        ZWWLog(@"数据库打开失败");
        return NO;
    }
    return errorMsg?NO:YES;
}

+ (NSArray *)querySqliteWithSql:(NSString *)sqlStr{
    NSMutableArray *stuList = [[NSMutableArray alloc]init];
    
    if(sqlite3_open(fileName.UTF8String, &dataBase) == SQLITE_OK){
        
        //sqlite3_stmt **ppStmt:查询的句柄，游标
        sqlite3_stmt  *ppStmt = nil;
        if (sqlite3_prepare(dataBase, sqlStr.UTF8String, -1, &ppStmt, NULL) == SQLITE_OK) {
            //查询处理操作（移动游标，查询每一条记录）
            while (sqlite3_step(ppStmt) == SQLITE_ROW) {
                //获取每一条记录
                //第一列：name
                NSString *name = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(ppStmt, 1) ];
                NSInteger age = sqlite3_column_int(ppStmt, 2);
                ZWWLog(@" name = %@,age = %zd",name,age);
                Student *stu = [[Student alloc]init];
                stu.age = age;
                stu.name = name;
                [stuList addObject:stu];
            }
            
        } else {
            ZWWLog(@"查询失败");
        }
        
        sqlite3_close(dataBase);
        
    } else {
        ZWWLog(@"数据库打开失败");
    }
    return stuList;
}
@end
