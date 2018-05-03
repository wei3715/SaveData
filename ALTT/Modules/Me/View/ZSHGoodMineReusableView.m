//
//  ZSHGoodMineReusableView.m
//  ZSHApp
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZSHGoodMineReusableView.h"

@interface ZSHGoodMineReusableView()
@end

@implementation ZSHGoodMineReusableView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSDictionary *headLabellDic = @{@"text":@"text", @"font":kPingFangMedium(15),@"textColor":KWhiteColor,@"textAlignment":@(NSTextAlignmentLeft)};
        _headLabel = [ZSHBaseUIControl createLabelWithParamDic:headLabellDic];
        [self addSubview:_headLabel];
        [_headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(kRealValue(13));
            make.centerY.mas_equalTo(self);
            make.width.mas_equalTo(KScreenWidth -2*kRealValue(13));
            make.height.mas_equalTo(kRealValue(40));
        }];
        
        NSDictionary *rightBtnDic = @{@"title":@"全部订单",@"titleColor":KZSHColorA0A0A0,@"font":kPingFangRegular(12),@"normalImage":@"mine_next"};
        _rightBtn = [ZSHBaseUIControl createBtnWithParamDic:rightBtnDic target:self action:@selector(rightBtnAction:)];
        _rightBtn.hidden = YES;
        _rightBtn.tag = 5;
        [_rightBtn layoutButtonWithEdgeInsetsStyle:XYButtonEdgeInsetsStyleRight imageTitleSpace:kRealValue(10.0)];
        [self addSubview:_rightBtn];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).offset(-KLeftMargin);
            make.centerY.mas_equalTo(self.headLabel);
            make.size.mas_equalTo(CGSizeMake(kRealValue(70), kRealValue(40)) );
        }];
        
        UIView *horizontalLine = [[UIView alloc]init];
        horizontalLine.backgroundColor = [UIColor colorWithHexString:@"1D1D1D"];
        [self addSubview:horizontalLine];
        [horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.headLabel.mas_bottom);
            make.height.mas_equalTo(kRealValue(0.5));
            make.left.right.mas_equalTo(self);
        }];
    }
    return self;
}



- (void)updateWithTitle:(NSString *)title {
    _headLabel.text = title;
    
}

- (void)rightBtnAction:(UIButton *)btn{
    if(self.rightBtnBlock){
        self.rightBtnBlock(btn.tag);
    }
 
}
                     
@end
