//
//  ALTTSingleImgViewController.m
//  ALTT
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTSingleImgViewController.h"
#import "ALTTSingleImgViewController+method.h"

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
    NSString *rightTitle = self.paramDic[@"rightTitle"]?self.paramDic[@"rightTitle"]:@"";
    [self addNavigationItemWithTitles:@[rightTitle] isLeft:NO target:self action:@selector(rightBtnAction) tags:@[@(10)]];
    
    [self.view addSubview:self.contentSV];
    [self.contentSV addSubview:self.contentIV];
    self.contentIV.userInteractionEnabled = YES;
    [self.contentIV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(contentIVTap:)]];
    
    if (kFromClassTypeValue == FromMineVCToTitleContentVC) {
        NSInteger index = [self.paramDic[@"index"]integerValue] + 1;
        self.contentIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"my_bj_%ld",index]];
    } else {
          self.contentIV.image = [UIImage imageNamed:self.paramDic[@"bgImg"]];
    }
 
   
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentSV);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(self.contentIV.image.size.height);
    }];
    
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(KNavigationBarHeight, 0, 0, 0));
        make.bottom.mas_equalTo(self.contentIV);
    }];
   
    
    switch (kFromClassTypeValue) {
        case FromO2OChooseVCToSingleImgVC:{
            [self createNaviUIWith:self.paramDic];
            break;
        }
        case FromMineVCToTitleContentVC:{

            [self.contentIV mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.contentSV);
                make.left.right.mas_equalTo(self.view);
                make.height.mas_equalTo(self.contentIV.image.size.height);
            }];
            
            [self.contentSV mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(self.view);
                make.bottom.mas_equalTo(self.contentIV);
            }];
        }
        default:
            break;
    }
}

- (void)contentIVTap:(UIGestureRecognizer *)gesture{
    
    switch (kFromClassTypeValue) {
        case FromGemStoreVCToSingleImgVC:{
            NSDictionary *nextParamDic = @{@"bgImg":@"star_bj_8",@"title":@"宝石链兑换"};
            ALTTSingleImgViewController *singleVC = [[ALTTSingleImgViewController alloc]initWithParamDic:nextParamDic];
            [self.navigationController pushViewController:singleVC animated:YES];
            break;
        }
            
        default:
            break;
    }
}

- (void)rightBtnAction{
    NSDictionary *nextParamDic = @{@"bgImg":@"gem_bg_0",@"title":@"宝石链兑换",KFromClassType:@(FromGemStoreVCToSingleImgVC)};
    ALTTSingleImgViewController *singleVC = [[ALTTSingleImgViewController alloc]initWithParamDic:nextParamDic];
    [self.navigationController pushViewController:singleVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
