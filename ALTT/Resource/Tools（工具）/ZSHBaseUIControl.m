//
//  ZSHBaseUIControl.m
//  ZSHApp
//
//  Created by zhaoweiwei on 2017/10/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZSHBaseUIControl.h"

@implementation ZSHBaseUIControl

// NSDictionary *titleLabelDic = @{@"text":@"回忆杀，不一样的三国《憨逗军团》",@"font":kPingFangMedium(15),@"textColor":KZSHColor414A4F,@"textAlignment":@(NSTextAlignmentCenter)};
+ (UILabel *)createLabelWithParamDic:(NSDictionary *)paramDic{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.tag = [paramDic[@"tag"]integerValue];
    label.text = paramDic[@"text"];
    label.font = paramDic[@"font"]?paramDic[@"font"]:kPingFangRegular(14);
    label.textColor = paramDic[@"textColor"]? paramDic[@"textColor"]:KZSHColor414A4F;
    label.textAlignment = [paramDic[@"textAlignment"]integerValue]? [paramDic[@"textAlignment"]integerValue]:NSTextAlignmentLeft;
   
    return label;
}

//NSDictionary *btnDic = @{@"title":titleArr[i],@"titleColor":KZSHColor414A4F,@"selectedTitleColor":KZSHColor414A4F,@"font":kPingFangRegular(14),@"backgroundColor":KClearColor,@"normalImage":imageArr[i],@"selectedImage":imageArr[i]};
+ (UIButton *)createBtnWithParamDic:(NSDictionary *)paramDic target:(id)target action:(SEL)action{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectZero];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.tag = [paramDic[@"tag"]integerValue];
    [btn setTitle:paramDic[@"title"] forState:UIControlStateNormal];
    
    UIColor *titleColor = paramDic[@"titleColor"]?paramDic[@"titleColor"]:KZSHColor414A4F;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    UIColor *selectedTitleColor = paramDic[@"selectedTitleColor"]?paramDic[@"selectedTitleColor"]:KZSHColor414A4F;
    [btn setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    
    UIColor *bgColor = paramDic[@"backgroundColor"]?paramDic[@"backgroundColor"]:KClearColor;
    [btn setBackgroundColor:bgColor];
    
    UIFont *titleFont = paramDic[@"font"]? paramDic[@"font"]:kPingFangRegular(14);
    btn.titleLabel.font = titleFont;
    
    UIImage *noremalImage = paramDic[@"normalImage"]?[UIImage imageNamed:paramDic[@"normalImage"]]:nil;
    [btn setImage:noremalImage forState:UIControlStateNormal];
    
    UIImage *selectImage = paramDic[@"selectedImage"]?[UIImage imageNamed:paramDic[@"selectedImage"]]:nil;
    [btn setImage:selectImage forState:UIControlStateSelected];
    
    
    return btn;
}

+ (UITableView *)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KScreenHeight - kRealValue(200), KScreenWidth, kRealValue(200)) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = KClearColor;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.backgroundColor = KClearColor;
    tableView.scrollsToTop = YES;
    return tableView;
}

+ (UIButton *)createLabelBtnWithTopDic:(NSDictionary *)topDic bottomDic:(NSDictionary *)bottomDic {
    UIButton *labelBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    labelBtn.backgroundColor = KClearColor;
    
    UILabel *topLabel = [ZSHBaseUIControl createLabelWithParamDic:topDic];
    topLabel.tag = 11;
    [labelBtn addSubview:topLabel];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(labelBtn);
        make.width.mas_equalTo(labelBtn);
        make.height.mas_equalTo( kRealValue([topDic[@"height"] integerValue]) );
        make.top.mas_equalTo(labelBtn);
    }];
    
    UILabel *bottomLabel = [ZSHBaseUIControl createLabelWithParamDic:bottomDic];
    bottomLabel.tag = 21;
    [labelBtn addSubview:bottomLabel];
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(topLabel);
        make.width.mas_equalTo(labelBtn);
        make.height.mas_equalTo( kRealValue([bottomDic[@"height"] integerValue]) );
        make.bottom.mas_equalTo(labelBtn);
    }];
    
    return labelBtn;
}

+ (UIView *)createTabHeadLabelViewWithParamDic:(NSDictionary *)paramDic{
   UIView *headView = [[UIView alloc]initWithFrame:CGRectZero];
    
    //左侧标题
    UILabel *headLabel = [ZSHBaseUIControl createLabelWithParamDic:paramDic];
    headLabel.tag = 1;
    [headView addSubview:headLabel];
    [headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        if ([paramDic[@"textAlignment"]integerValue] == NSTextAlignmentCenter) {
             make.centerX.mas_equalTo(headView);
        } else if ([paramDic[@"leftValue"]integerValue]){
             make.left.mas_equalTo(headView).offset([paramDic[@"leftValue"]integerValue]);
        } else {
            make.left.mas_equalTo(headView).offset(KLeftMargin);
        }
       
        make.height.mas_equalTo(headView);
        make.width.mas_equalTo(headView);
        make.centerY.mas_equalTo(headView);
    }];
    
    //右侧箭头按钮
    NSString *btnTitle = paramDic[@"btnTitle"]?paramDic[@"btnTitle"]:@"换一批";
    UIFont *font = paramDic[@"font"]?paramDic[@"font"]:kPingFangMedium(15);
    CGFloat rightValue = [paramDic[@"btnRightValue"]integerValue]?[paramDic[@"btnRightValue"]integerValue]:KLeftMargin;
    
    NSDictionary *btnDic = @{@"title":btnTitle,@"selectedTitleColor":KZSHColorC6F500,@"font":font};
    UIButton *refreshBtn = [ZSHBaseUIControl  createBtnWithParamDic:btnDic target:self action:nil];
    UIImage *normalImage = [UIImage imageNamed:paramDic[@"btnImage"]];
    [refreshBtn setImage:normalImage forState:UIControlStateNormal];

    refreshBtn.tag = 2;
    refreshBtn.hidden = YES;
    [headView addSubview:refreshBtn];
    [refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(headView);
        make.width.mas_equalTo(kRealValue(50));
        make.height.mas_equalTo(headView);
        make.right.mas_equalTo(headView).offset(-rightValue);
    }];
    CGFloat btnImageOffset = paramDic[@"btnImageOffset"]?[paramDic[@"btnImageOffset"]floatValue]:0;
    [refreshBtn layoutButtonWithEdgeInsetsStyle:XYButtonEdgeInsetsStyleRight imageTitleSpace:btnImageOffset];
    return headView;
}

+ (void) setAnimationWithHidden:(BOOL)hidden view:(UIView *)view completedBlock:(RemoveCompletedBlock)completedBlock {
    NSString *functionName = kCAMediaTimingFunctionEaseIn;
    NSString *animationKey = @"ZSHAlertViewShow";
    if (hidden) {
        functionName = kCAMediaTimingFunctionEaseOut;
        animationKey = @"ZSHAlertViewHide";
    }
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.5f];
    animation.removedOnCompletion = NO;
    [animation setType:kCATransitionFade];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:functionName]];
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:animationKey];
    if (hidden) {
        [view removeFromSuperview];
        view = nil;
        if (completedBlock) {
            completedBlock();
        }
        return;
        
    } else {
        [[UIApplication sharedApplication].keyWindow addSubview:view];
    }
}

+ (UIView *)createBottomButton:(void (^)(NSInteger ))tapBlock {
    UIView *_bottomBtnView = [[UIView alloc]initWithFrame:CGRectZero];
    _bottomBtnView.backgroundColor = KZSHColor111F27;
    _bottomBtnView.frame = CGRectMake(0, KScreenHeight - KBottomTabH, KScreenWidth, KBottomNavH);
    NSArray *imagesNor = @[@"goods_service",@"goods_collect"];
    NSArray *imagesSel = @[@"goods_service",@"goods_collect"];
    CGFloat buttonW = kRealValue(30);
    
    for (NSInteger i = 0; i < imagesNor.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = KClearColor;
        [button setImage:[UIImage imageNamed:imagesNor[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imagesSel[i]] forState:UIControlStateSelected];
        button.tag = i;
        [button addTapBlock:^(UIButton *btn) {
            tapBlock(btn.tag);
        }];
//        [button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonX = kRealValue(25) + ((buttonW +kRealValue(28))  * i);
        [_bottomBtnView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(buttonW, buttonW));
            make.centerY.mas_equalTo(_bottomBtnView);
            make.left.mas_equalTo(buttonX);
        }];
    }
    NSArray *titles = @[@"加入购物车",@"立即购买"];
    for (NSInteger i = 0; i < titles.count; i++) {
        NSDictionary *btnDic = @{@"title":titles[i],@"titleColor":KZSHColor414A4F,@"font":kPingFangMedium(17)};
        UIButton *button = [ZSHBaseUIControl  createBtnWithParamDic:btnDic target:self action:nil];
        button.tag = i + 2;
        [button addTapBlock:^(UIButton *btn) {
            tapBlock(btn.tag);
        }];
        [_bottomBtnView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(_bottomBtnView);
            make.width.mas_equalTo(kRealValue(120));
            make.left.mas_equalTo(kRealValue(135)+i*kRealValue(120));
            make.centerY.mas_equalTo(_bottomBtnView);
        }];
    }
    return _bottomBtnView;
}

+ (UIView *)createLineViewWihtFrame:(CGRect)frame color:(UIColor*)lineColor{
    UIView *lineView = [[UIView alloc]initWithFrame:frame];
    lineView.backgroundColor = lineColor;
    return lineView;
}



@end
