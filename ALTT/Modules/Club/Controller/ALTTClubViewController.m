//
//  ALTTClubViewController.m
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTClubViewController.h"

@interface ALTTClubViewController ()

@end

@implementation ALTTClubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
    
}

- (void)createUI{
    self.title = @"Club";
    [self addNavigationItemWithImageName:@"friend_nav_screen" isLeft:NO target:self action:@selector(rightBtnAction) tag:10];
    [self.view addSubview:self.contentSV];
    [self.contentSV addSubview:self.contentIV];
    
    self.contentIV.userInteractionEnabled = YES;
    self.contentIV.image = [UIImage imageNamed:@"friend_bg_1"];
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentSV);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(self.contentIV.image.size.height);
    }];
    
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(KNavigationBarHeight, 0, 0, 0));
        make.bottom.mas_equalTo(self.contentIV).offset(KBottomTabH);
    }];
    
}

- (void)rightBtnAction{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
