//
//  ZWWTableViewController+method.m
//  MediaTest
//
//  Created by mac on 2018/5/19.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWTableViewController+method.h"
#import "Student.h"

@implementation ZWWTableViewController (method)

- (void)archiverAction{
    Student *t1 = [[Student alloc]init];
   
    t1.name = @"zww";
    t1.age = 18;
    
    NSData *encodeData = [NSKeyedArchiver archivedDataWithRootObject:t1];
    [[NSUserDefaults standardUserDefaults]setObject:encodeData forKey:@"student"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    NSData *deData = [[NSUserDefaults standardUserDefaults]objectForKey:@"student"];
    Student *deStu = [NSKeyedUnarchiver unarchiveObjectWithData:deData];
    ZWWLog(@"NSUserDefaults存储的对象name ==%@",deStu.name);
}

@end
