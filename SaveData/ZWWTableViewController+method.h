//
//  ZWWTableViewController+method.h
//  MediaTest
//
//  Created by mac on 2018/5/19.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWTableViewController.h"

@interface ZWWTableViewController (method)

//NSUserDefaults 存储自定义对象
- (void)archiverAction;

//测试钥匙串永久存储数据,卸载App后仍可记录App信息
- (void)testKechainSaveDate;
- (void)testZWWKechainManagerSaveDate;
@end
