//
//  ALTTO2OBottomViewController.m
//  ALTT
//
//  Created by mac on 2018/4/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTO2OBottomViewController.h"

@interface ALTTO2OBottomViewController ()

@end

@implementation ALTTO2OBottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{
    kWeakSelf(self);
    self.contentSizeArr = @[@(kRealValue(1400)/2.0),@(kRealValue(1834)/2.0),@(1742),@(kRealValue(1494)/2.0),@(kRealValue(1494)/2.0)];
    [self.view addSubview:self.contentSV];
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself.view).insets(UIEdgeInsetsMake(0, 0, KBottomTabH, 0));
    }];
    
    [self.contentSV addSubview:self.contentIV];
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself.contentSV);
    }];

    NSInteger index = [self.paramDic[@"index"]integerValue];
    self.contentSV.contentSize = CGSizeMake(0, [self.contentSizeArr[index]floatValue]);
    self.contentIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"o2o_bg_bottom_%ld",index]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
