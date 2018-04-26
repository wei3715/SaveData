//
//  ZSHTextFieldCellView.m
//  ZSHApp
//
//  Created by zhaoweiwei on 2017/9/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZSHTextFieldCellView.h"

@interface ZSHTextFieldCellView()<UITextFieldDelegate>{
    NSTimer *_timer;
    NSInteger _i;
}

@property (nonatomic, strong) UILabel      *leftLabel;
@property (nonatomic, strong) YYLabel      *getCaptchaBtn;
@property (nonatomic, strong) UIView       *verticalLine;
@property (nonatomic, strong) UIView       *bottomLine;


@end

@implementation ZSHTextFieldCellView

- (void)setup{
    _i = -1;
    [self addSubview:self.leftLabel];
    [self addSubview:self.textField];
    [self addSubview:self.getCaptchaBtn];
    [self addSubview:self.verticalLine];
    [self addSubview:self.bottomLine];
    
    if (self.paramDic[@"leftTitle"]) {
        [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(KLeftMargin);
            make.centerY.mas_equalTo(self);
            make.width.mas_equalTo(kRealValue(80));
            make.height.mas_equalTo(kRealValue(15));
        }];
    }
    
    if ([self.paramDic[@"textFieldType"] integerValue] != ZSHTextFieldViewNone) {
            [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.leftLabel.mas_right);
                make.right.mas_equalTo(self).offset(-40);
                make.top.mas_equalTo(self);
                make.bottom.mas_equalTo(self);
            }];
    }
    
    if ([self.paramDic[@"textFieldType"] integerValue] == ZSHTextFieldSelect) {
        self.textField.enabled = false;
        self.textField.text = self.paramDic[@"text"];
        self.textField.userInteractionEnabled = true;
    }
    
    if ([self.paramDic[@"textFieldType"] integerValue] == ZSHTextFieldViewPhone) {
        self.textField.keyboardType = UIKeyboardTypePhonePad;
    }
    
    if ([self.paramDic[@"textFieldType"]integerValue] == ZSHTextFieldViewCaptcha) {
        [self.getCaptchaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(kRealValue(15));
            make.width.mas_equalTo(kRealValue(77));
            make.right.mas_equalTo(self).offset(-10);
        }];
        
        [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(kRealValue(12));
            make.bottom.mas_equalTo(self).offset(-kRealValue(12));
            make.width.mas_equalTo(0.5);
            make.right.mas_equalTo(self.getCaptchaBtn.mas_left).offset(-10);
        }];
    }
    
    if (kFromClassTypeValue == FromLoginVCToTextFieldCellView||kFromClassTypeValue == FromCardVCToTextFieldCellView) {
        [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
            make.bottom.mas_equalTo(self);
            make.left.mas_equalTo(self);
            make.right.mas_equalTo(self);
        }];
    }
}


#pragma getter
- (UILabel *)leftLabel{
    if (!_leftLabel) {
        NSString *leftTitle = self.paramDic[@"leftTitle"]?self.paramDic[@"leftTitle"]:@"";
        NSDictionary *leftLabelDic = @{@"text":leftTitle,@"font":kPingFangRegular(14)};
        _leftLabel = [ZSHBaseUIControl createLabelWithParamDic:leftLabelDic];
        _leftLabel.frame = CGRectZero;
    }
    return _leftLabel;
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectZero];
        _textField.textColor = KZSHColor414A4F;
        _textField.tintColor = KZSHColor414A4F;
        _textField.backgroundColor = KClearColor;
        _textField.font = kPingFangLight(14);
        _textField.delegate = self;
        NSString *placeholder = self.paramDic[@"placeholder"]?self.paramDic[@"placeholder"]:@"";
        _textField.placeholder = placeholder;
        _textField.secureTextEntry = ([self.paramDic[@"textFieldType"]integerValue] == ZSHTextFieldViewPwd);
        UIColor *placeholderTextColor = self.paramDic[@"placeholderTextColor"]?self.paramDic[@"placeholderTextColor"]:KZSHColor414A4F;
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName:placeholderTextColor}];
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField;
}

- (UIView *)verticalLine{
    if (!_verticalLine) {
        _verticalLine = [[UIView alloc] initWithFrame:CGRectZero];
        _verticalLine.backgroundColor = [UIColor colorWithWhite:1 alpha:0.15];
    }
    return _verticalLine;
}

- (YYLabel *)getCaptchaBtn{
    if (!_getCaptchaBtn) {
        kWeakSelf(self)
        _getCaptchaBtn = [[YYLabel alloc] init];
        _getCaptchaBtn.text = @"获取验证码";
        _getCaptchaBtn.font = kPingFangRegular(14);
        _getCaptchaBtn.textColor = KLightWhiteColor;
        _getCaptchaBtn.backgroundColor = KClearColor;
        _getCaptchaBtn.textAlignment = NSTextAlignmentRight;
        _getCaptchaBtn.textVerticalAlignment = YYTextVerticalAlignmentCenter;
        _getCaptchaBtn.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            if (_i == -1) {
                _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startCount) userInfo:nil repeats:YES];
                _i = 60;
                [weakself startCount];
                [weakself submit];
            }
        };
    }
    return _getCaptchaBtn;
}

- (UIView *)bottomLine{
    if (!_bottomLine) {
        
        _bottomLine = [[UIView alloc]initWithFrame:CGRectZero];
        _bottomLine.backgroundColor = KZSHColor2A2A2A;
    }
    return _bottomLine;
}

#pragma action

- (void)updateViewWithParamDic:(NSDictionary *)paramDic{
    _leftLabel.text = paramDic[@"leftTitle"];
    _textField.placeholder = self.paramDic[@"placeholder"];
    _textField.secureTextEntry = ([self.paramDic[@"textFieldType"]integerValue] == ZSHTextFieldViewPwd);
}

- (void)textFieldDidChange:(UITextField *)textField{
    if (self.textFieldChanged) {
        self.textFieldChanged(textField.text,self.tag);
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([self.paramDic[@"textFieldType"]integerValue] == ZSHTextFieldSelect) {
            return false;
    } else
        return true;
}

- (void)submit {
    
//    [SMSSDKUIProcessHUD showProcessHUDWithInfo:SMSLocalized(@"commitingCode")];
//
//    [SMSSDK commitVerificationCode:_codeTextField.text phoneNumber:_phone zone:_zone result:^(NSError *error) {
//
//        NSString *msg = SMSLocalized(@"verifycodeerrortitle");
//        if (error)
//        {
//            [SMSSDKUIProcessHUD dismiss];
//            SMSSDKAlert(@"%@:%@",msg,error);
//        }
//        else
//        {
//            SMSUILog(@"commit code success !");
//            [SMSSDKUIProcessHUD showSuccessInfo:SMSLocalized(@"commitSuccess")];
//            [SMSSDKUIProcessHUD dismissWithDelay:1.5 result:^{
//                [_timer invalidate];
//                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//            }];
//        }
//    }];
}


- (void)startCount
{
    NSString *text = [@[[NSString stringWithFormat:@"%zd",_i], @"秒"] componentsJoinedByString:@""];
    if (!_i--) {
        _getCaptchaBtn.text = @"重新发送";
        [_timer invalidate];
    } else {
        _getCaptchaBtn.text = text;
    }
}

@end
