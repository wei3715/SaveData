//
//  ALTTSingleImgViewController.m
//  ALTT
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTSingleImgViewController.h"

@interface ALTTSingleImgViewController ()

@end

@implementation ALTTSingleImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{
    
    self.title = self.paramDic[@"title"];
    
    [self.view addSubview:self.contentSV];
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(KNavigationBarHeight, 0, KBottomTabH, 0));
    }];
    self.contentSV.contentSize = CGSizeMake(0, [self.paramDic[@"contentSizeH"]floatValue]);
    
//    if (![self.paramDic[@"contentSizeH"]floatValue]) {
//        self.contentSV.scrollEnabled = NO;
//    }
    
    [self.contentSV addSubview:self.contentIV];
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentSV);
    }];
    self.contentIV.image = [UIImage imageNamed:self.paramDic[@"bgImg"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
