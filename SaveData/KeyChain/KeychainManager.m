//
//  KeychainManager.m
//  SaveData
//
//  Created by mac on 2018/8/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KeychainManager.h"

@implementation KeychainManager

+(KeychainManager*)shareKeychainManager
{
    static KeychainManager *keychainManager = nil;
    if(keychainManager == nil)
    {
        keychainManager = [[KeychainManager alloc] init];
    }
    return keychainManager;
}
/*!
 创建生成保存数据查询条件
 */
- (NSMutableDictionary *)getKeychainQuery:(NSString *)identifier {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            identifier, (id)kSecAttrService,
            identifier, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

/*!
 保存数据
 */
- (void)saveData:(id)data identifier:(NSString *)identifier {
    //获取存储的数据的条件
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:identifier];
    // 删除旧的数据
    SecItemDelete((CFDictionaryRef)keychainQuery);
    // 设置新的数据
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    // 添加数据
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

- (id)readDataWithIdentifier:(NSString *)identifier {
    id ret = nil;
    
    // 通过标记获取数据查询条件
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:identifier];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", identifier, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

/*!
 更新数据
 @data  要更新的数据
 @identifier 数据存储时的标示
 */
- (BOOL)updateData:(id)data identifier:(NSString*)identifier {
    // 通过标记获取数据更新的条件
    NSMutableDictionary * keyChainUpdataQueryMutableDictionary = [self getKeychainQuery:identifier];
    // 创建更新数据字典
    NSMutableDictionary * updataMutableDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    // 存储数据
    [updataMutableDictionary setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    // 获取存储的状态
    OSStatus  updataStatus = SecItemUpdate((CFDictionaryRef)keyChainUpdataQueryMutableDictionary, (CFDictionaryRef)updataMutableDictionary);
    // 释放对象
    keyChainUpdataQueryMutableDictionary = nil;
    updataMutableDictionary = nil;
    // 判断是否更新成功
    if (updataStatus == errSecSuccess) {
        return  YES ;
    }
    return NO;
}


- (void)deleteDataWithIdentifier:(NSString *)identifier {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:identifier];
    SecItemDelete((CFDictionaryRef)keychainQuery);
    // 释放内存
    keychainQuery = nil ;
}

@end
