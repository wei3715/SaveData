//
//  KeychainManager.h
//  SaveData
//
//  Created by mac on 2018/8/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainManager : NSObject

+(KeychainManager*)default;
//根据字典存储对象到钥匙串
- (void)save:(NSString *)service data:(id)data;
//根据字典读取钥匙串里的对象
- (id)load:(NSString *)service;
//删除钥匙串里的数据
- (void)delete:(NSString *)service;

@end
