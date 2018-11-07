//
//  KeychainManager.h
//  SaveData
//
//  Created by mac on 2018/8/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainManager : NSObject

+(KeychainManager*)shareKeychainManager;
//根据字典存储对象到钥匙串
- (void)saveData:(id)data identifier:(NSString *)identifier;
//根据字典读取钥匙串里的对象
- (id)readDataWithIdentifier:(NSString *)identifier;

/*!
 更新数据
 @data  要更新的数据
 @identifier 数据存储时的标示
 */
- (BOOL)updateData:(id)data identifier:(NSString*)identifier;

//删除钥匙串里的数据
- (void)deleteDataWithIdentifier:(NSString *)identifier;

@end
