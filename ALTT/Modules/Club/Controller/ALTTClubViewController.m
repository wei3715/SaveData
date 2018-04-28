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
    
    [self.view addSubview:self.contentSV];
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(KNavigationBarHeight, 0, KBottomTabH, 0));
    }];
    self.contentSV.contentSize = CGSizeMake(0, 0);
    self.contentSV.scrollEnabled = NO;
    
    
    [self.contentSV addSubview:self.contentIV];
    self.contentIV.userInteractionEnabled = YES;
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentSV);
    }];
    self.contentIV.image = [UIImage imageNamed:@"friend_bg_1"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
