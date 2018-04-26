//
//  ALTTTitleContentViewController.m
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTTitleContentViewController.h"
#import "ALTTTitleContentViewController+Method.h"
#import "LXScrollContentView.h"
#import "LXScollTitleView.h"

@interface ALTTTitleContentViewController ()

@property (nonatomic, strong) LXScrollContentView *contentView;
@property (nonatomic, strong) LXScollTitleView    *titleView;
@property (nonatomic, strong) NSArray             *titleArr;
@property (nonatomic, strong) NSArray             *menuIDArr;
@property (nonatomic, strong) NSArray             *contentVCS;
@property (nonatomic, strong) NSArray             *paramArr;
@property (nonatomic, strong) NSDictionary        *nextParamDic;


@end

@implementation ALTTTitleContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
    [self createUI];
}

- (void)loadData{
    self.vcs = [[NSMutableArray alloc]init];
    self.titleArr = self.paramDic[@"titleArr"];
}

- (void)createUI{
    self.extendedLayoutIncludesOpaqueBars = YES;
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.contentView];
    kWeakSelf(self);
    if(kFromClassTypeValue == FromO2ORecommendToTitleContentVC ){
        self.titleView.frame = CGRectMake(0, 0, KScreenWidth, kRealValue(35));
//        self.contentView.frame = CGRectMake(0, kRealValue(35), KScreenWidth, kRealValue(1320)/2);
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakself.titleView.mas_bottom);
            make.bottom.mas_equalTo(weakself.view).offset(-KBottomTabH);
            make.left.right.mas_equalTo(weakself.view);
        }];
    } else {
       [self createNaviUIWith:self.paramDic];
    }
    
   
    [self startLocateWithDelegate:self];
    [self reloadListData];
}

- (LXScollTitleView *)titleView{
    if (!_titleView) {
        _titleView = [[LXScollTitleView alloc] initWithFrame:CGRectMake(0, KNavigationBarHeight, KScreenWidth, kRealValue(35))];
        _titleView.normalTitleFont = kPingFangRegular(15);
        _titleView.selectedTitleFont = kPingFangMedium(15);
        _titleView.normalColor = KZSHColorA0A0A0;
        _titleView.selectedColor = KZSHColorC6F500;
        _titleView.indicatorHeight = self.paramDic[@"indicatorHeight"]?[self.paramDic[@"indicatorHeight"]floatValue]:0;
        __weak typeof(self) weakSelf = self;
        _titleView.selectedBlock = ^(NSInteger index){
            __weak typeof(self) strongSelf = weakSelf;
            strongSelf.vcIndex = index;
            strongSelf.contentView.currentIndex = index;
        };
    }
    return _titleView;
}

- (LXScrollContentView *)contentView{
    if (!_contentView) {
        _contentView = [[LXScrollContentView alloc] initWithFrame:CGRectMake(0,kRealValue(35) + KNavigationBarHeight, KScreenWidth,KScreenHeight - kRealValue(35) - KNavigationBarHeight)];
        kWeakSelf(self);
        _contentView.scrollBlock = ^(NSInteger index){
            __weak typeof(self) strongSelf = weakself;
            strongSelf.titleView.selectedIndex = index;
        };
    }
    return _contentView;
}

- (void)reloadListData{
    self.titleView.titleWidth = KScreenWidth/self.titleArr.count;
    [self.titleView reloadViewWithTitles:self.titleArr];
    RootViewController *vc = nil;
    
    for (int i = 0; i<self.titleArr.count; i++) {
        Class className = NSClassFromString(self.paramDic[@"className"]);
        vc = [[className alloc]initWithParamDic:@{@"index":@(i)}];
        [self.vcs addObject:vc];
    }
    
    [self.contentView reloadViewWithChildVcs:self.vcs parentVC:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
