//
//  Student.m
//  SaveData
//
//  Created by mac on 2018/6/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *)description{
    return [NSString stringWithFormat:@"name==%@,age==%zd",_name,_age];
}
@end
