//
//  ALTTHomeViewController.m
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTHomeViewController.h"

@interface ALTTHomeViewController ()

@property (nonatomic, strong) UIScrollView  *contentSV;
@property (nonatomic, strong) UIImageView   *contentIV;
@property (nonatomic, strong) NSArray       *contentSizeArr;
@end

@implementation ALTTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{
    kWeakSelf(self);
    _contentSizeArr = @[@(kRealValue(1744)/2.0),@(kRealValue(1774)/2.0),@(0),@(kRealValue(1974)/2.0),@(0)];
    [self.view addSubview:self.contentSV];
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself.view).insets(UIEdgeInsetsMake(0, 0, KBottomTabH, 0));
    }];
    
    [self.contentSV addSubview:self.contentIV];
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself.contentSV);
    }];
    
    
    NSInteger index = [self.paramDic[@"index"]integerValue];
    self.contentSV.contentSize = CGSizeMake(0, [_contentSizeArr[index]floatValue]);
    self.contentIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"home_index_%ld",index]];
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
