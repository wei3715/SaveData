//
//  ALTTHomeViewController.m
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTHomeViewController.h"

@interface ALTTHomeViewController ()


@end

@implementation ALTTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{
    
    [self.view addSubview:self.contentSV];
    [self.contentSV addSubview:self.contentIV];
    self.contentIV.userInteractionEnabled = YES;
    NSInteger index = [self.paramDic[@"index"]integerValue];
    self.contentIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"home_index_%ld",index]];
    [self.contentIV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(contentIVTap:)]];
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentSV);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(self.contentIV.image.size.height);
    }];

    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.contentIV);
    }];

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
