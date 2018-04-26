//
//  ZSHSearchBarView.m
//  ZSHApp
//
//  Created by zhaoweiwei on 2017/10/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZSHSearchBarView.h"

@interface ZSHSearchBarView()


@end

@implementation ZSHSearchBarView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
//    self.placeholder = @"搜索";
//    [self setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
//    [self setValue:[UIFont boldSystemFontOfSize:30] forKeyPath:@"_placeholderLabel.font"];
    self.borderStyle = UITextBorderStyleRoundedRect;
    self.returnKeyType = UIReturnKeySearch;
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kRealValue(15), kRealValue(15))];
    imgView.userInteractionEnabled = YES;
    imgView.image = [UIImage imageNamed:@"nav_home_search"];
    self.leftView = imgView;
    self.leftViewMode = UITextFieldViewModeAlways;
    //向 这张图片添加一个手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnClick:)];
    [imgView addGestureRecognizer:tap];
}

//实现按钮点击事件
-(void)btnClick:(UIButton *)btn{
    
}

@end
