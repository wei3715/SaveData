//
//  ALTTShopCartViewController.m
//  ALTT
//
//  Created by mac on 2018/4/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTShopCartViewController.h"

@interface ALTTShopCartViewController ()

@property (nonatomic, strong) UIScrollView                      *contentSV;
@property (nonatomic, strong) UIImageView                       *contentIV;

@end

@implementation ALTTShopCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{
    kWeakSelf(self);

    self.title = @"购物车";
    [self.view addSubview:self.contentSV];
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself.view).insets(UIEdgeInsetsMake(0, KNavigationBarHeight, 0, 0));
    }];
    
    [self.contentSV addSubview:self.contentIV];
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself.contentSV);
    }];
   
    self.contentSV.contentSize = CGSizeMake(0, 0);
    self.contentIV.image = [UIImage imageNamed:@"o2o_bg_balance"];
}

#pragma getter
- (UIScrollView *)contentSV{
    if (!_contentSV) {
        _contentSV = [[UIScrollView alloc]init];
        _contentSV.showsVerticalScrollIndicator = NO;
        _contentSV.showsHorizontalScrollIndicator = NO;
        _contentSV.scrollsToTop = NO;
    }
    return _contentSV;
}

- (UIImageView *)contentIV{
    if (!_contentIV) {
        _contentIV = [[UIImageView alloc]init];
    }
    return _contentIV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
