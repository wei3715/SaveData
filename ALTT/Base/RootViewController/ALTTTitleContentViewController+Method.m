//
//  ALTTTitleContentViewController+Method.m
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTTitleContentViewController+Method.h"
#import "ALTTShopCartViewController.h"

@implementation ALTTTitleContentViewController (Method)

- (void)createNaviUIWith:(NSDictionary *)paramDic{
//    [self.navigationItem setTitleView:self.searchView];
//    self.searchView.frame = CGRectMake(0, 0, kRealValue(270), 30);
    UIImage *searhImg = [UIImage imageNamed:@"search"];
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,searhImg.size.width, 30)];
    [searchBtn setImage:searhImg forState:UIControlStateNormal];
    [self.navigationItem setTitleView:searchBtn];
    
    [self addNavigationItemWithImageName:paramDic[@"leftImage"]  isLeft:YES target:self action:@selector(leftBtnAction) tag:10];
    [self addNavigationItemWithImageName:paramDic[@"rightImage"] isLeft:NO target:self action:@selector(rightBtnAction) tag:20];
}

- (void)leftBtnAction{
    
}

- (void)rightBtnAction{
    if (kFromClassTypeValue == FromO2OVCToTitleContentVC) {
        ALTTShopCartViewController *shopCartVC = [[ALTTShopCartViewController alloc]init];
        [self.navigationController pushViewController:shopCartVC animated:YES];
    }
}



@end
