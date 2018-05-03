//
//  ALTTTitleContentViewController.h
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "RootViewController.h"

typedef void(^ChangeIndex)(NSInteger index);

@interface ALTTTitleContentViewController : RootViewController


@property (nonatomic, strong) NSMutableArray      *vcs;
@property (nonatomic, assign) NSInteger           vcIndex;
@property (nonatomic, copy)   ChangeIndex         changeIndexBlock;

@end
