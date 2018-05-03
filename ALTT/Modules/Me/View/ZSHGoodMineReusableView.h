//
//  ZSHGoodMineReusableView.h
//  ZSHApp
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RightBtnBlock)(NSInteger tag);
@interface ZSHGoodMineReusableView : UICollectionReusableView

@property (nonatomic, strong) UILabel       *headLabel;
@property (nonatomic, strong) UIButton      *rightBtn;
@property (nonatomic, copy)   RightBtnBlock rightBtnBlock;

- (void)updateWithTitle:(NSString *)title;

@end
