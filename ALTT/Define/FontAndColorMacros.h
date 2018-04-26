//
//  FontAndColorMacros.h
//  MiAiApp
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

//字体大小和颜色配置

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

#pragma mark -  常用颜色区

#define KClearColor                    [UIColor clearColor]
#define KWhiteColor                    [UIColor whiteColor]
#define KBlackColor                    [UIColor blackColor]
#define KGrayColor                     [UIColor grayColor]
#define KGray2Color                    [UIColor lightGrayColor]
#define KBlueColor                     [UIColor blueColor]
#define KRedColor                      [UIColor redColor]
#define KGreenColor                    [UIColor greenColor]
#define KZSHColor242D32               [UIColor colorWithHexString:@"242D32"]
#define KZSHColorCD933B               [UIColor colorWithHexString:@"CD933B"]
#define KZSHColorFD5739               [UIColor colorWithHexString:@"FD5739"]
#define KZSHColor979797               [UIColor colorWithHexString:@"979797"]
#define KZSHColorFF2366               [UIColor colorWithHexString:@"FF2366"]
#define KZSHColor262626               [UIColor colorWithHexString:@"262626"]
#define KZSHColor3B3B3B               [UIColor colorWithHexString:@"3B3B3B"]
#define KZSHColor333333               [UIColor colorWithHexString:@"333333"]
#define KZSHColor111F27               [UIColor colorWithHexString:@"111F27"]     //tabbar背景色
#define KZSHColor414A4F               [UIColor colorWithHexString:@"414A4F"]     //tabbar未选中字体色
#define KZSHColorC6F500               [UIColor colorWithHexString:@"C6F500"]     //tabbar选中字体色
#define KZSHColorB2B2B2               [UIColor colorWithHexString:@"B2B2B2"]
#define KZSHColorE9E9E9               [UIColor colorWithHexString:@"E9E9E9"]
#define KZSHColor8E8E93               [UIColor colorWithHexString:@"8E8E93"]
#define KZSHColor1D1D1D               [UIColor colorWithHexString:@"1D1D1D"]
#define KZSHColorE5E5E5               [UIColor colorWithHexString:@"E5E5E5"]     //主题色：导航栏颜色
#define KZSHColorA0A0A0               [UIColor colorWithHexString:@"A0A0A0"]     //titleview默认色
#define KZSHColor9BA4AE               [UIColor colorWithHexString:@"9BA4AE"]
#define KZSHColorDFDFDF               [UIColor colorWithHexString:@"DFDFDF"]
#define KZSHColor181818               [UIColor colorWithHexString:@"181818"]
#define KZSHColor454545               [UIColor colorWithHexString:@"454545"]
#define KZSHColorFF2068               [UIColor colorWithHexString:@"FF2068"]
#define KZSHColor141414               [UIColor colorWithHexString:@"141414"]
#define KZSHColorD8D8D8               [UIColor colorWithHexString:@"D8D8D8"]
#define KZSHColor1A1A1A               [UIColor colorWithHexString:@"1A1A1A"]
#define KZSHColor2A2A2A               [UIColor colorWithHexString:@"2A2A2A"]
#define KZSHColor3D3D3D               [UIColor colorWithHexString:@"3D3D3D"]
#define KZSHColor58AABE               [UIColor colorWithHexString:@"58AABE"]
#define KZSHColor3E3E3E               [UIColor colorWithHexString:@"3E3E3E"]
#define KZSHColorA61CE7               [UIColor colorWithHexString:@"A61CE7"]

#define KZSHColorRGB(R,G,B)            [UIColor colorWithRed:(R * 1.0) / 255.0 green:(G * 1.0) / 255.0 blue:(B * 1.0) / 255.0 alpha:1.0]
#define KZSHColorRGBA(R,G,B,A)         [UIColor colorWithRed:(R * 1.0) / 255.0 green:(G * 1.0) / 255.0 blue:(B * 1.0) / 255.0 alpha:A]
#define kRandomColor                   KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)        //随机色生成
#define KShadowColor                   KZSHColorRGBA(0,0,0,0.85)
#define KLightWhiteColor               KZSHColorRGBA(255,255,255,0.7)


#pragma mark -  字体区

#define kFontTypeANB                    @"AvenirNext-Bold"
#define kFontTypeANM                    @"AvenirNext-Medium"
#define kFontTypeANDB                   @"avenirnextdemibold"
#define kFontTypePingFangLight          @".PingFang Light"
#define kFontTypePingFangE              @".PingFang ExtraLight"

#define kFontTypePingFangSCR            @".PingFangSC-Regular"
#define kFontTypePingFangSCL            @".PingFangSC-Light"
#define kFontTypePingFangSCT            @".PingFang-SC-Thin"
#define kFontTypePingFangSCM            @".PingFangSC-Medium"
#define kFontTypePingFangSCR            @".PingFangSC-Regular"
#define kFontTypePingFangSCS            @".PingFang-SC-Semibold"

#define kDINCondBold(fontSize)          [UIFont fontWithName:@"DINCond-Bold" size:(fontSize)*(KScreenWidth/375.0f)]
#define kPingFangLight(fontSize)        [UIFont fontWithName:@".PingFangSC-Light" size:(fontSize)*(KScreenWidth/375.0f)]
#define kPingFangRegular(fontSize)      [UIFont fontWithName:@".PingFangSC-Regular" size:(fontSize)*(KScreenWidth/375.0f)]
#define kGeorgia(fontSize)              [UIFont fontWithName:@"Georgia" size:(fontSize)*(KScreenWidth/375.0f)]

#define kPingFangMedium(fontSize)       [UIFont fontWithName:@".PingFangSC-Medium" size:(fontSize)*(KScreenWidth/375.0f)]
#define kPingFangSemibold(fontSize)     [UIFont fontWithName:@".PingFangSC-Semibold" size:(fontSize)*(KScreenWidth/375.0f)]
#define kNettoOT(fontSize)              [UIFont fontWithName:@"NettoOT" size:(fontSize)*(KScreenWidth/375.0f)]
#define kNettoOTBold(fontSize)          [UIFont fontWithName:@"NettoOT-Bold" size:(fontSize)*(KScreenWidth/375.0f)]
#define kNettoOTThin(fontSize)          [UIFont fontWithName:@"NettoOT-Thin" size:(fontSize)*(KScreenWidth/375.0f)]
#define kNettoOTLight(fontSize)         [UIFont fontWithName:@"nettoOT-Light" size:(fontSize)*(KScreenWidth/375.0f)]
#define kDSDigi(fontSize)               [UIFont fontWithName:@"DS-Digital" size:(fontSize)*(KScreenWidth/375.0f)]

#define BOLDSYSTEMFONT(FONTSIZE)        [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)            [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)            [UIFont fontWithName:(NAME) size:((FONTSIZE)*(KScreenWidth/375.0f))]

             

#endif /* FontAndColorMacros_h */
