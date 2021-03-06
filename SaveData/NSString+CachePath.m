//
//  NSString+CachePath.m
//  SaveData
//
//  Created by mac on 2018/6/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NSString+CachePath.h"

@implementation NSString (CachePath)

+ (NSString *)cachePathWithFileName:(NSString *)fileName{
   return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName];
}


@end
