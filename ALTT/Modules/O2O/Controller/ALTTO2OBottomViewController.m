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

    [self.view addSubview:self.contentSV];
    self.contentSV.scrollEnabled = NO;
    NSInteger index = [self.paramDic[@"index"]integerValue];
    UIImage *contentImage = [UIImage imageNamed:[NSString stringWithFormat:@"o2o_bg_bottom_%ld",index]];
    [self.contentSV addSubview:self.contentIV];
    self.contentIV.image = contentImage;
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentSV);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(contentImage.size.height);
    }];
    
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.contentIV).offset(KBottomTabH);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
