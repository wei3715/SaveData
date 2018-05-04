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

@property (nonatomic, strong) ZSHGuideView                      *guideView;
@property (nonatomic, strong) UIView                            *recommendView;
@property (nonatomic, assign) NSInteger                         bottomIndex;
@property (nonatomic, strong) UIScrollView                      *bottomSV;
@end

@implementation ALTTO2OViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{

    [self.view addSubview:self.contentSV];
    [self.contentSV addSubview:self.contentIV];
    self.contentIV.userInteractionEnabled = YES;
     [self.contentIV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(contentIVTap:)]];

    NSInteger index = [self.paramDic[@"index"]integerValue];
    self.contentSV.contentSize = CGSizeMake(0, [self.contentSizeArr[index]floatValue]);
    if (index == 0) {//推荐
        [self.contentSV addSubview:self.guideView];
        [self.guideView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(contentIVTap:)]];
        [self.guideView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentSV);
            make.left.right.mas_equalTo(self.view);
            make.height.mas_equalTo(kRealValue(170));
        }];
        [self.guideView updateViewWithParamDic:@{@"dataArr":@[@"o2o_banner"]}];
        [self.contentSV addSubview:self.recommendView];
        [self.recommendView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(contentIVTap:)]];
        
        [self.recommendView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.guideView.mas_bottom);
            make.left.right.mas_equalTo(self.view);
            make.height.mas_equalTo(kRealValue(750));
        }];
        
        [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.recommendView);
        }];
        
    } else {
       UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"o2o_bg_%ld",index]];
        [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(image.size.height);
            make.top.mas_equalTo(self.contentSV);
            make.left.right.mas_equalTo(self.view);
        }];
        self.contentIV.image = image;
        
        [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.contentIV).offset(KBottomTabH);
        }];
    }
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
        kWeakSelf(self);
        NSArray *recommendTitleArr = @[@"推荐优品",@"大牌驾到",@"时尚达人",@"小资搭配"];
        ALTTTitleContentViewController *bottomVC = [[ALTTTitleContentViewController alloc]initWithParamDic:@{@"titleArr":recommendTitleArr,KFromClassType:@(FromO2ORecommendToTitleContentVC),@"className":@"ALTTO2OBottomViewController"}];
        _bottomSV = [bottomVC valueForKey:@"contentSV"];
        bottomVC.changeIndexBlock = ^(NSInteger index) {
            weakself.bottomIndex = index;
        };
        _recommendView = bottomVC.view;
    }
    return _recommendView;
}

- (void)contentIVTap:(UIGestureRecognizer *)gesture{
    
    NSDictionary *nextParamDic = @{@"bgImg":@"news_bj",@"title":@"资讯"};
    ALTTSingleImgViewController *singleVC = [[ALTTSingleImgViewController alloc]initWithParamDic:nextParamDic];
    [self.navigationController pushViewController:singleVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
