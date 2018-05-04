//
//  ZSHBaseUIControl.h
//  ZSHApp
//
//  Created by zhaoweiwei on 2017/10/20.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZSHBaseTableViewModel;

typedef NS_ENUM(NSInteger,ZSHCellType){
    ZSHCollectionViewCellType,
    ZSHTableViewCellType
};

typedef NS_ENUM(NSInteger,ZSHShopType){
    ZSHFoodShopType,     //美食
    ZSHKTVShopType,      //KTV
    ZSHHotelShopType,    //酒店
    ZSHBarShopType,      //酒吧
    ZSHHorseType,        //马术
    ZSHShipType,         //游艇
    ZSHPlaneType,        //飞机
    ZSHGolfType,         //高尔夫
    ZSHLuxcarType,       //豪车
    ZSHServiceType,      //服务
    ZSHOtherShopType,   //其它
};

typedef NS_ENUM(NSInteger,ZSHToChangePWDView){
    FromHomeNoticeVCToNoticeView,     //首页 - 公告
    FromHomeServiceVCToNoticeView,    //首页 - 玩趴
    FromHomeMagazineVCToNoticeView,   //首页 - 荣耀杂志
    FromHomeMusicVCToNoticeView,      //首页 - 音乐
    FromKTVCalendarVCToNoticeView,      //KTV详情 - 预定日历
    FromKTVRoomTypeVCToNoticeView,      //KTV详情 - 包间类型
    FromMemberCenterVCToNoticeView,     //会员中心 - 类型
    FromEnergyValueVCToNoticeView,      //能量值 - 类型
    FromMusicMenuToNoticeView,          //音乐 - 歌单推荐
    FromMusicLibraryToNoticeView,       //音乐 - 曲库推荐
    FromMusicSingerToNoticeView,        //音乐 - 歌手推荐
    FromMusicRankToNoticeView,          //音乐 - 榜单推荐
    FromDefaultVCToChangePWDView
};

typedef NS_ENUM(NSUInteger,ZSHFromVCToHotelDetailVC){//** -> 详情页面
    ZSHFromFoodVCToHotelDetailVC,      //美食-美食详情
    ZSHFromHotelVCToHotelDetailVC,     //酒店-酒店详情
    ZSHFromHomeKTVVCToHotelDetailVC,   //KTV-KTV详情
    ZSHFromHomeBarVCToHotelDetailVC,   //酒吧-酒吧详情
    ZSHFromHotelPayVCToHotelDetailVC,  //酒店确认订单-底部弹窗
    ZSHFromNoneVCToHotelDetailVC
};

typedef NS_ENUM(NSUInteger,ZSHFromVCToHotelVC){//** -> 酒店列表页面
    ZSHFromHomeHotelVCToHotelVC,     //首页酒店-酒店
    ZSHFromHomeKTVVCToHotelVC,       //首页KTV-KTV（酒店）
    ZSHFromNoneVCToHotelVC
};

typedef NS_ENUM(NSUInteger,ZSHFromVCToHotelPayVC){//** -> 订单支付页面
    ZSHFromHotelDetailVCToHotelPayVC = 1,           //酒店详情-酒店支付
    ZSHFromHotelDetailBottomVCToHotelPayVC,         //酒店详情(底部弹窗)-酒店支付
    ZSHFromKTVDetailVCToHotelPayVC,                 //KTV详情-KTV支付
    ZSHFromNoneVCToHotelPayVC
};

// 显示选择
typedef NS_ENUM(NSInteger, ShowPickViewWindowType) {
    WindowBirthDay,                // 出生日期
    WindowGender,                  // 性别
    WindowRegion,                  // 区域
    WindowInterval,                // 区间
    WindowTime,                    // 年份
    WindowCoupon,                  // 优惠券
    WindowKTVHour,                 // KTV时间选择
    WindowTogether,                // 汇聚
    WindowLogistics,               // 物流公司
    WindowSeat,                    // 座位选择
    WindowPapers,                  // 证件选择
    WindowPrice,                   // 价格
    WindowSort,                    // 排序
    WindowDefault
};

typedef NS_ENUM(NSInteger,ZSHToSimpleCellView){
    FromSetEditInfoVCToSimpleCellView,     //设置-个人资料
    FromSetNoticeInfoVCToSimpleCellView,   //设置-新消息通知
    FromNoneToSimpleCellView
};

typedef NS_ENUM (NSInteger,ZSHToTextFieldCellView) {
    FromMultiInfoNickNameVCToTextFieldCellView,    //修改昵称 - 自定义view
    FromMultiInfoAccountVCToTextFieldCellView,     //找回登录密码 - 自定义View
    FromAirTicketDetailVCToTextFieldCellView,      //机票弹窗-个人信息
    FromMultiInfoQQVCToTextFieldCellView,          //绑定QQ帐号
    FromMultiPhoneVCToTextFieldCellView,           //更改手机号
    FromLoginVCToTextFieldCellView,                //登录-自定义View
    FromCardVCToTextFieldCellView,                 //黑卡定制-自定义View
    FromNoneToTextFieldCellView
};

typedef NS_ENUM(NSInteger,ZSHToSingleImgVC){
    FromGemStoreVCToSingleImgVC,                       //宝石链兑换
    FromO2OChooseVCToSingleImgVC,                      //o2o筛选
    FromDefaultToMultiInfoVC
};

typedef NS_ENUM (NSInteger,ZSHToNotificationVC) {
    FromSettingVCToNotificationVC,         //设置 - 新消息通知
    FromLiveMineVCToNotificationVC,        //尚播 - 设置
    FromActivityCenterVCToNotificationVC
};

typedef NS_ENUM (NSInteger,ZSHToGuideView) {
    FromGuideVCToGuideView,           //引导页 - 轮播view
    FromCardVCToGuideView,            //黑卡设置页 - 轮播view
    FromHotelDetailVCToGuideView,     //酒店（美食，ktv详情页） - 轮播view
    FromGoodsDetailVCToGuideView,     // 商品详情
    FromBuyVCToGuideView,             // 尊购首页轮播
    FromTogetherToGuideView,          // 吃喝玩乐轮播
    FromNoneVCToGuideView
};

typedef NS_ENUM(NSUInteger,ZSHToTitleContentVC){
    FromHomeVCToTitleContentVC,              //首页
    FromO2OVCToTitleContentVC,               //O2O
    FromO2ORecommendToTitleContentVC,        //O2O推荐
    FromMineVCToTitleContentVC,              //我的-全部订单
    FromPeronalCenterVCToTitleContentVC,     //个人中心（黑微博，小视频， 资料）
    FromMagazineVCToTitleContentVC,          //荣耀杂志（推荐，科技，吃喝，心灵， 时尚....）
    FromBuyVCToTitleContentVC,               //尊购
    FromNoneToTitleContentVC
};

typedef NS_ENUM(NSInteger, ShowCellType) {
    ZSHNormalType,                     // 正常形式（确认订单-支付页面）
    ZSHPopType,                        // 弹框形式（确认订单弹窗）
    ZSHOtherType,                      // 其他
};


@interface ZSHBaseUIControl : NSObject

+ (UILabel *)createLabelWithParamDic:(NSDictionary *)paramDic;
+ (UIButton *)createBtnWithParamDic:(NSDictionary *)paramDic target:(id)target action:(SEL)action;
+ (UITableView *)createTableView;
+ (UIButton *)createLabelBtnWithTopDic:(NSDictionary *)topDic bottomDic:(NSDictionary *)bottomDic;
+ (UIView *)createTabHeadLabelViewWithParamDic:(NSDictionary *)paramDic;
+ (void) setAnimationWithHidden:(BOOL)hidden view:(UIView *)view completedBlock:(RemoveCompletedBlock)completedBlock;
+ (UIView *)createBottomButton:(void (^)(NSInteger ))tapBlock;
+ (UIView *)createLineViewWihtFrame:(CGRect)frame color:(UIColor*)lineColor;

@end
