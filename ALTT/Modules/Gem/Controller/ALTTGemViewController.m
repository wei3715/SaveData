//
//  ALTTHomeViewController.m
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTGemViewController.h"
#import "ALTTSingleImgViewController.h"
@interface ALTTGemViewController ()

@property (strong, nonatomic) UIButton *gemBtn;
@property (strong, nonatomic) UIButton *energyBtn;


@end

@implementation ALTTGemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{
    kWeakSelf(self);
//    self.title = @"";
//    NSDictionary *navBtnDic = @{@"normalImage":@"notice",@"title":@"公告：ALiTaiTai 珠宝星球区块链场景上线啦",@"titleColor":KWhiteColor};
//    UIButton *navBtn = [ZSHBaseUIControl  createBtnWithParamDic:navBtnDic target:self action:nil];
//    navBtn.frame = CGRectMake(0, 0, KScreenWidth, KNavigationBarHeight);
//    [self.navigationController.navigationBar addSubview:navBtn];
    

    [self.view addSubview:self.contentSV];
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself.view).insets(UIEdgeInsetsMake(KNavigationBarHeight, 0, KBottomTabH, 0));
    }];
    self.contentSV.contentSize = CGSizeMake(0, kRealValue(2080)/2);
    
    
    [self.contentSV addSubview:self.contentIV];
    self.contentIV.userInteractionEnabled = YES;
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakself.contentSV);
    }];
    self.contentIV.image = [UIImage imageNamed:@"star_bj"];
    
    
    NSDictionary *topBtnDic = @{@"normalImage":@"yellow"};
    _gemBtn = [ZSHBaseUIControl  createBtnWithParamDic:topBtnDic target:self action:nil];
    [self.contentIV addSubview:_gemBtn];
    [_gemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentIV).offset(kRealValue(60));
        make.left.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(kRealValue(160), kRealValue(40)));
    }];
    
    NSDictionary *sbottomBtnDic = @{@"normalImage":@"green"};
    _energyBtn = [ZSHBaseUIControl  createBtnWithParamDic:sbottomBtnDic target:self action:nil];
    [self.contentIV addSubview:_energyBtn];
    [_energyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.gemBtn.mas_bottom);
        make.left.mas_equalTo(self.gemBtn);
        make.size.mas_equalTo(CGSizeMake(kRealValue(160), kRealValue(40)));
    }];
    
    CGFloat maxY = 0;
    NSArray *btnImageArr = @[@"guess",@"games",@"friends",@"star_btn_1",@"secret",@"star_btn_2"];
    for (int i = 0; i <3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth/3 * i, KNavigationBarHeight + kRealValue(800), KScreenWidth/3, kRealValue(40))];
        [btn addTarget:self action:@selector(topThreeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:btnImageArr[i]] forState:UIControlStateNormal];
        btn.tag = i + 10;
        [self.contentIV addSubview:btn];
        maxY = CGRectGetMaxY(btn.frame);
    }
    
    NSDictionary *bottmLeftBtnDic = @{@"normalImage":@"star_btn_1"};
    UIButton *bottmLeftBtn = [ZSHBaseUIControl createBtnWithParamDic:bottmLeftBtnDic target:self action:@selector(bottomThreeBtnAction:)];
    bottmLeftBtn.frame = CGRectMake(KLeftMargin, maxY + kRealValue(50), kRealValue(100), kRealValue(30));
    bottmLeftBtn.tag = 13;
    [self.contentIV addSubview:bottmLeftBtn];
    
    NSDictionary *bottomMidBtnDic = @{@"normalImage":@"secret"};
    UIButton *bottomMidBtn = [ZSHBaseUIControl createBtnWithParamDic:bottomMidBtnDic target:self action:@selector(bottomThreeBtnAction:)];
    bottomMidBtn.frame = CGRectMake((KScreenWidth - kRealValue(70))/2,CGRectGetCenter(bottmLeftBtn.frame).y, kRealValue(70), kRealValue(70));
    bottomMidBtn.centerY = CGRectGetCenter(bottmLeftBtn.frame).y;
    bottomMidBtn.tag = 14;
    [self.contentIV addSubview:bottomMidBtn];
    
    NSDictionary *bottmRightBtnDic = @{@"normalImage":@"star_btn_2"};
    UIButton *bottmRightBtn = [ZSHBaseUIControl createBtnWithParamDic:bottmRightBtnDic target:self action:@selector(bottomThreeBtnAction:)];
    bottmRightBtn.frame = CGRectMake(KScreenWidth - KLeftMargin - kRealValue(100), maxY + kRealValue(50), kRealValue(100), kRealValue(30));
    bottmRightBtn.tag = 15;
    [self.contentIV addSubview:bottmRightBtn];
    
}

#pragma action
- (void)topThreeBtnAction:(UIButton *)btn{
    
}

- (void)bottomThreeBtnAction:(UIButton *)btn{
    
    NSInteger tag = btn.tag - 12;
    NSArray *contentTitleArr = @[@"宝石星球",@"星球秘籍",@"我的宝石"];
    NSArray *contentSizeH = @[@(kRealValue(1814)/2),@(kRealValue(1210)/2),@(kRealValue(1206)/2)];
    NSDictionary *nextParamDic = @{@"bgImg":[NSString stringWithFormat:@"star_bj_%ld",tag],@"contentSizeH":contentSizeH[tag - 1],@"title":contentTitleArr[tag - 1]};
    ALTTSingleImgViewController  *singleImgVC = [[ALTTSingleImgViewController alloc]initWithParamDic:nextParamDic];
    [self.navigationController pushViewController:singleImgVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
