//
//  ALTTClubViewController.m
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTClubViewController.h"

@interface ALTTClubViewController ()

@property (nonatomic, assign)  BOOL          haveFriend;
@property (nonatomic, strong)  UIImageView   *maskIV;
@end

@implementation ALTTClubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _haveFriend = NO;
    self.contentIV.image = [UIImage imageNamed:@"friend_bg_1"];
}

- (void)createUI{
    self.title = @"Club";
    [self addNavigationItemWithImageName:@"friend_nav_screen" isLeft:NO target:self action:@selector(rightBtnAction) tag:10];
    [self.view addSubview:self.contentSV];
    [self.contentSV addSubview:self.contentIV];
    
    self.contentIV.userInteractionEnabled = YES;
    [self.contentIV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeImg:)]];
    self.contentIV.image = [UIImage imageNamed:@"friend_bg_1"];
    [self.contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentSV);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(self.contentIV.image.size.height);
    }];
    
    [self.contentSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(KNavigationBarHeight, 0, 0, 0));
        make.bottom.mas_equalTo(self.contentIV).offset(KBottomTabH);
    }];
    
}

- (UIImageView *)maskIV{
    if (!_maskIV) {
        _maskIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"friend_bg_2"]];
        _maskIV.userInteractionEnabled = YES;
        _maskIV.bounds = kAppWindow.bounds;
        [_maskIV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissMaskIV:)] ];
    }
    return _maskIV;
}

- (void)changeImg:(UIGestureRecognizer *)gesture{
    if (!_haveFriend) {
        self.contentIV.image=[UIImage imageNamed:@"friend_bg_3"];
        CATransition *ca = [CATransition animation];
        ca.type = @"push";
        ca.subtype = kCATransitionFromRight;
        ca.duration=0.5;
        ca.startProgress=0.5;
        //1.6设置动画的终点
        //    ca.endProgress=0.5;
        [self.contentIV.layer addAnimation:ca forKey:nil];
        _haveFriend = YES;
       
    } else {
         NSDictionary *nextParamDic = @{@"bgImg":@"friend_bg_4",@"title":@"好友聊天"};
         ALTTSingleImgViewController *singleVC = [[ALTTSingleImgViewController alloc]initWithParamDic:nextParamDic];
        [self.navigationController pushViewController:singleVC animated:YES];
    }

}

- (void)dismissMaskIV:(UIGestureRecognizer *)gesture{
    [ZSHBaseUIControl setAnimationWithHidden:YES view:self.maskIV completedBlock:nil];
}


- (void)rightBtnAction{
    [ZSHBaseUIControl setAnimationWithHidden:NO view:self.maskIV completedBlock:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
