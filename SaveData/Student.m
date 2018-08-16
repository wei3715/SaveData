//
//  Student.m
//  SaveData
//
//  Created by mac on 2018/6/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
@implementation Student

- (NSString *)description{
    return [NSString stringWithFormat:@"name==%@,age==%zd",_name,_age];
}

//归档
- (void)encodeWithCoder:(NSCoder *)coder
{
    encodeClass(Student);
}

//解档
- (instancetype)initWithCoder:(NSCoder *)coder
{
    decoderClass(Student);
}
@end
