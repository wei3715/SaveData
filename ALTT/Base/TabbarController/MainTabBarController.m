//
//  MainTabBarController.m
//  MiAiApp
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MainTabBarController.h"
#import "RootNavigationController.h"
#import "TabBarItem.h"
#import "ALTTO2OViewController.h"
#import "ALTTGemViewController.h"
#import "ALTTClubViewController.h"
#import "ALTTMineViewController.h"

@interface MainTabBarController ()<TabBarDelegate,UITabBarControllerDelegate>

@property (nonatomic,strong) NSMutableArray * VCS;   //tabbar root VC

@end

@implementation MainTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化tabbar
    [self setUpTabBar];
    
    //添加子控制器
    [self setUpAllChildViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self removeOriginControls];
}

#pragma mark ————— 初始化TabBar —————
-(void)setUpTabBar{
    [self.tabBar addSubview:({
        TabBar *tabBar = [[TabBar alloc] init];
        tabBar.toTabBarType = FromMainTabVCToTabBar;
        tabBar.backgroundColor = KZSHColor111F27;
        tabBar.frame     = self.tabBar.bounds;
        tabBar.delegate  = self;
        self.TabBar = tabBar;
    })];
    
}
#pragma mark - ——————— 初始化VC ————————
-(void)setUpAllChildViewController{
    _VCS = @[].mutableCopy;
    
    NSArray *homeTitleArr = @[@"头条",@"专栏",@"活动",@"寄语",@"＋"];
    ALTTTitleContentViewController *homeVC = [[ALTTTitleContentViewController alloc]initWithParamDic:@{@"titleArr":homeTitleArr,KFromClassType:@(FromHomeVCToTitleContentVC),@"leftImage":@"home_nav_more",@"rightImage":@"home_nav_photo",@"className":@"ALTTHomeViewController"}];
    [self setupChildViewController:homeVC title:@"Home" imageName:@"tab_home_nor" seleceImageName:@"tab_home_pre"];
    
    
    NSArray *o2oTitleArr = @[@"推荐",@"发现",@"买手",@"私定",@"特权"];
    ALTTTitleContentViewController *O2OVC = [[ALTTTitleContentViewController alloc]initWithParamDic:@{@"titleArr":o2oTitleArr,KFromClassType:@(FromO2OVCToTitleContentVC),@"leftImage":@"home_nav_more",@"rightImage":@"o2o_nav_car",@"className":@"ALTTO2OViewController"}];
    [self setupChildViewController:O2OVC title:@"O2O" imageName:@"tab_o2o_nor" seleceImageName:@"tab_o2o_pre"];
    
    ALTTGemViewController *gemVC = [[ALTTGemViewController alloc]init];
    [self setupChildViewController:gemVC title:@"宝石星球" imageName:@"tab_star_nor" seleceImageName:@"tab_star_pre"];
    
    ALTTClubViewController *clubVC = [[ALTTClubViewController alloc]init];
    [self setupChildViewController:clubVC title:@"Club" imageName:@"tab_club_nor" seleceImageName:@"tab_club_pre"];
    
    ALTTMineViewController *mineVC = [[ALTTMineViewController alloc]init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"tab_me_nor" seleceImageName:@"tab_me_pre"];
    
    self.viewControllers = _VCS;
}

-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    //    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];

    //包装导航控制器
    RootNavigationController *nav = [[RootNavigationController alloc]initWithRootViewController:controller];
//    controller.title = title;
    [_VCS addObject:nav];
}

#pragma mark ————— 统一设置tabBarItem属性并添加到TabBar —————
- (void)setViewControllers:(NSArray *)viewControllers {
    
    self.TabBar.badgeTitleFont         = kPingFangRegular(10);
    self.TabBar.itemTitleFont          = kPingFangRegular(10);
    self.TabBar.itemImageRatio         = self.itemImageRatio == 0 ? 0.7 : self.itemImageRatio;
    self.TabBar.itemTitleColor         = KZSHColor414A4F;
    self.TabBar.selectedItemTitleColor = KZSHColorC6F500;
    
    self.TabBar.tabBarItemCount = viewControllers.count;
    
    [viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIViewController *VC = (UIViewController *)obj;
        UIImage *selectedImage = VC.tabBarItem.selectedImage;
        VC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self addChildViewController:VC];
        [self.TabBar addTabBarItem:VC.tabBarItem];
    }];
}

#pragma mark ————— 选中某个tab —————
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    
    [super setSelectedIndex:selectedIndex];
    
    self.TabBar.selectedItem.selected = NO;
    self.TabBar.selectedItem = self.TabBar.tabBarItems[selectedIndex];
    self.TabBar.selectedItem.selected = YES;
}

#pragma mark ————— 取出系统自带的tabbar并把里面的按钮删除掉 —————
- (void)removeOriginControls {
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
        if ([obj isKindOfClass:[UIControl class]]) {
            [obj removeFromSuperview];
        }
    }];
}

#pragma mark - TabBarDelegate Method

- (void)tabBar:(TabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return ![viewController isEqual:tabBarController.viewControllers[1]];
}


@end
