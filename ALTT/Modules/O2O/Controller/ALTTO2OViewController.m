//
//  ALTTHomeViewController.m
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTO2OViewController.h"
#import "ALTTTitleContentViewController.h"
@interface ALTTO2OViewController ()

@property (nonatomic, strong) UIScrollView                      *contentSV;
@property (nonatomic, strong) UIImageView                       *contentIV;
@property (nonatomic, strong) NSArray                           *contentSizeArr;
@property (nonatomic, strong) ZSHGuideView                      *guideView;
@property (nonatomic, strong) UIView                            *recommendView;
@end

@implementation ALTTO2OViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{
    kWeakSelf(self);
    _contentSizeArr = @[@(kRealValue(1600)/2.0),@(kRealValue(1834)/2.0),@(1742),@(kRealValue(1494)/2.0),@(kRealValue(1494)/2.0)];
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
    if (index == 0) {//推荐
        [self.contentSV addSubview:self.guideView];
        [self.guideView updateViewWithParamDic:@{@"dataArr":@[@"o2o_banner"]}];
        [self.contentSV addSubview:self.recommendView];
        self.recommendView.frame = CGRectMake(0, kRealValue(170), KScreenWidth, kRealValue(1400));
//        [self.recommendView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(weakself.contentSV).insets(UIEdgeInsetsMake(kRealValue(170), 0, 0, 0));
//        }];

    } else {
        self.contentIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"o2o_bg_%ld",index]];
    }
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

- (ZSHGuideView *)guideView {
    if(!_guideView) {
        NSDictionary *nextParamDic = @{KFromClassType:@(FromBuyVCToGuideView),@"pageViewHeight":@(kRealValue(170)),@"min_scale":@(0.6),@"withRatio":@(1.8),@"infinite":@(false)};
        _guideView = [[ZSHGuideView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, kRealValue(170)) paramDic:nextParamDic];
        UIPageControl *pageControl =  [_guideView valueForKey:@"pageControl"];
        pageControl.hidden = YES;
    }
    return _guideView;
}

- (UIView *)recommendView{
    if (!_recommendView) {
        NSArray *recommendTitleArr = @[@"推荐优品",@"大牌驾到",@"时尚达人",@"小资搭配"];
        ALTTTitleContentViewController *bottomVC = [[ALTTTitleContentViewController alloc]initWithParamDic:@{@"titleArr":recommendTitleArr,KFromClassType:@(FromO2ORecommendToTitleContentVC),@"className":@"ALTTO2OBottomViewController"}];
        _recommendView = bottomVC.view;
    }
    return _recommendView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
