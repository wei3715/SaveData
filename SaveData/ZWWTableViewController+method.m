//
//  ZWWTableViewController+method.m
//  MediaTest
//
//  Created by mac on 2018/5/19.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWTableViewController+method.h"
#import "Student.h"
#import "KeychainManager.h"
#import <CommonCrypto/CommonDigest.h>

#import "ZWWKeyChainManager.h"
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

- (void)testKechainSaveDate{
    KeychainManager *manager = [KeychainManager shareKeychainManager];
    NSData *getData = [manager readDataWithIdentifier:KeychainKey];
    NSDictionary *getDic = [NSKeyedUnarchiver unarchiveObjectWithData:getData];
    if (getDic == nil) {
        NSLog(@"保存成功");
        NSDictionary *dic = @{@"userName":@"zww",@"hasGotMoney":@(YES)};
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dic];
        [manager saveData:data identifier:KeychainKey];
    }
    
    //更新数据
//    NSDictionary *updateDic = @{@"userName":@"zww2018",@"hasGotMoney":@(NO)};
//    NSData *updateData = [NSKeyedArchiver archivedDataWithRootObject:updateDic];
//    [manager updateData:updateData identifier:KeychainKey];
    
    //删除数据
//    [manager deleteDataWithIdentifier:KeychainKey];
    NSLog(@"获取得到的数据userName==%@,hasGotMoney==%zd",getDic[@"userName"],[getDic[@"hasGotMoney"]integerValue]);
    
}

- (void)testZWWKechainManagerSaveDate{
    //删除数据
//    [ZWWKeyChainManager keyChainDelete:ZWWKeyChainKey];
//    NSLog(@"删除清空数据成功");
//    return;
    
    //获取/查询数据
    NSData *getData = [ZWWKeyChainManager keyChainReadData:ZWWKeyChainKey];
    NSDictionary *getDic = [NSKeyedUnarchiver unarchiveObjectWithData:getData];
    NSLog(@"获取上次存储的数据color==%@,height==%zd",getDic[@"color"],[getDic[@"height"]integerValue]);
    
    //存储数据
    if (getDic == nil) {
        NSDictionary *dic = @{@"color":@"purple",@"height":@(167)};
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dic];
        BOOL saveSuccess = [ZWWKeyChainManager keyChainSaveData:data withIdentifier:ZWWKeyChainKey];
        if (saveSuccess) {
            NSLog(@"存储成功");
        } else {
            NSLog(@"存储失败");
        }
    }

    //更新数据
//    NSDictionary *updateDic = @{@"color":@"pink",@"height":@(172)};
//    NSData *updateData = [NSKeyedArchiver archivedDataWithRootObject:updateDic];
//    [ZWWKeyChainManager keyChainUpdata:updateData withIdentifier:ZWWKeyChainKey];
//    NSLog(@"更新数据成功");
//    NSData *getUpdateData = [ZWWKeyChainManager keyChainReadData:ZWWKeyChainKey];
//    NSDictionary *getUpdateDic = [NSKeyedUnarchiver unarchiveObjectWithData:getUpdateData];
//    NSLog(@"获取得更新后的数据color==%@,height==%zd",getUpdateDic[@"color"],[getUpdateDic[@"height"]integerValue]);



}

@end
