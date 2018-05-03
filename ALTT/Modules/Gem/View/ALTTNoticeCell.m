//
//  ALTTNoticeCell.m
//  ALTT
//
//  Created by mac on 2018/5/3.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTNoticeCell.h"

@interface ALTTNoticeCell ()

@property (nonatomic, strong) UIImageView *leftIV;
@property (nonatomic, strong) UILabel     *topLB;
@property (nonatomic, strong) UILabel     *bottomLB;
@property (nonatomic, strong) UIButton    *rightBtn;

@end

@implementation ALTTNoticeCell

- (void)setup{
    [self.contentView addSubview:self.leftIV];
    [self.contentView addSubview:self.topLB];
    [self.contentView addSubview:self.bottomLB];
    [self.contentView addSubview:self.rightBtn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(KLeftMargin);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kRealValue(44), kRealValue(44)));
    }];
    
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftIV.mas_right).offset(KLeftMargin);
        make.top.mas_equalTo(self.leftIV);
        make.size.mas_equalTo(CGSizeMake(kRealValue(100), kRealValue(20)));
    }];
    
    [_bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.topLB);
        make.top.mas_equalTo(self.topLB.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(kRealValue(200), kRealValue(20)));
    }];
    
    _rightBtn.layer.cornerRadius = 2.0;
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-KLeftMargin);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kRealValue(50), kRealValue(15)));
    }];
}

- (UIImageView *)leftIV{
    if (!_leftIV) {
        _leftIV = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _leftIV;
}

- (UILabel *)topLB{
    if (!_topLB) {
        NSDictionary *topLBDic = @{@"font":kPingFangRegular(14),@"textColor":KZSHColorCCCCCC};
        _topLB = [ZSHBaseUIControl createLabelWithParamDic:topLBDic];
    }
    return _topLB;
}

- (UILabel *)bottomLB{
    if (!_bottomLB) {
         NSDictionary *bottomLBDic = @{@"font":kPingFangRegular(11),@"textColor":KZSHColorCCCCCC};
        _bottomLB =  [ZSHBaseUIControl createLabelWithParamDic:bottomLBDic];
    }
    return _bottomLB;
}

- (UIButton *)rightBtn{
    if (!_rightBtn) {
        NSDictionary *rightBtnDic = @{@"title":@"+100能量",@"titleColor":KZSHColor3F3F3F,@"font":kPingFangRegular(10),@"backgroundColor":KZSHColorC6F500};
        _rightBtn =  [ZSHBaseUIControl createBtnWithParamDic:rightBtnDic target:nil action:@selector(rightBtnAction)];
        
    }
    return _rightBtn;
}

- (void)rightBtnAction{
    
}

- (void)updateCellWithParamDic:(NSDictionary *)dic{
    _leftIV.image = [UIImage imageNamed:dic[@"leftImg"]];
    _topLB.text = dic[@"topTitle"];
    _bottomLB.text = dic[@"bottomTitle"];
    [_rightBtn setTitle:dic[@"btnTitle"] forState:UIControlStateNormal];
    if (dic[@"btnImg"]) {
        _rightBtn.backgroundColor = [UIColor clearColor];
        [_rightBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        [_rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, kRealValue(5), 0, 0)];
        [_rightBtn setImage:[UIImage imageNamed:dic[@"btnImg"]] forState:UIControlStateNormal];
    }
    
}

@end
