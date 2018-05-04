//
//  ALTTSingleImgViewController+method.m
//  ALTT
//
//  Created by mac on 2018/5/4.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTSingleImgViewController+method.h"

@implementation ALTTSingleImgViewController (method)

- (void)createNaviUIWith:(NSDictionary *)paramDic{

    UIImage *searhImg = [UIImage imageNamed:@"search"];
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,searhImg.size.width, 30)];
    [searchBtn setImage:searhImg forState:UIControlStateNormal];
    [self.navigationItem setTitleView:searchBtn];
    
    [self addNavigationItemWithImageName:paramDic[@"leftImage"]  isLeft:YES target:self action:@selector(leftBtnAction) tag:10];
    [self addNavigationItemWithImageName:paramDic[@"rightImage"] isLeft:NO target:self action:@selector(rightBtnAction) tag:20];
}

@end
