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


@interface ALTTTitleContentViewController ()<LXSegmentTitleViewDelegate,LXScrollContentViewDelegate>

@property (nonatomic, strong) LXScrollContentView *contentView;
@property (nonatomic, strong) LXSegmentTitleView  *titleView;
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
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.contentView];
    
    kWeakSelf(self);
    switch (kFromClassTypeValue) {
        case FromO2ORecommendToTitleContentVC:{
            self.titleView.frame = CGRectMake(0, 0, KScreenWidth, kRealValue(35));
            [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.titleView.mas_bottom);
                make.bottom.mas_equalTo(weakself.view).offset(-KBottomTabH);
                make.left.right.mas_equalTo(weakself.view);
            }];
            
            break;
        }
            
        case FromHomeVCToTitleContentVC:
        case FromO2OVCToTitleContentVC:{
            [self createNaviUIWith:self.paramDic];
            break;
        }
        default:
            break;
    }
    
   
//    [self startLocateWithDelegate:self];
    [self reloadData];
}

- (LXSegmentTitleView *)titleView{
    if (!_titleView) {
        _titleView = [[LXSegmentTitleView alloc] initWithFrame:CGRectMake(0, KNavigationBarHeight, KScreenWidth, kRealValue(35))];
        _titleView.titleFont = kPingFangRegular(15);
//        _titleView.selectedTitleFont = kPingFangMedium(15);
        _titleView.titleNormalColor = KZSHColorA0A0A0;
        _titleView.titleSelectedColor = KZSHColorC6F500;
        _titleView.indicatorHeight = self.paramDic[@"indicatorHeight"]?[self.paramDic[@"indicatorHeight"]floatValue]:0;
        _titleView.delegate = self;
        _titleView.itemMinMargin = kRealValue(15.0);
        _titleView.backgroundColor = KClearColor;
    }
    return _titleView;
}

- (LXScrollContentView *)contentView{
    if (!_contentView) {
        _contentView = [[LXScrollContentView alloc] initWithFrame:CGRectMake(0,kRealValue(35) + KNavigationBarHeight, KScreenWidth,KScreenHeight - kRealValue(35) - KNavigationBarHeight)];
        _contentView.delegate = self;
    }
    return _contentView;
}

- (void)segmentTitleView:(LXSegmentTitleView *)segmentView selectedIndex:(NSInteger)selectedIndex lastSelectedIndex:(NSInteger)lastSelectedIndex{
    self.contentView.currentIndex = selectedIndex;
    if (self.changeIndexBlock) {
        self.changeIndexBlock(selectedIndex);
    }
}

- (void)contentViewDidScroll:(LXScrollContentView *)contentView fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(float)progress{
    
}

- (void)contentViewDidEndDecelerating:(LXScrollContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex{
    self.titleView.selectedIndex = endIndex;
    if (self.changeIndexBlock) {
        self.changeIndexBlock(endIndex);
    }
}

- (void)reloadData{
    self.titleView.segmentTitles = self.titleArr;;
    NSMutableArray *vcs = [[NSMutableArray alloc] init];
    RootViewController *vc = nil;
    for (int i = 0; i<self.titleArr.count; i++) {
        Class className = NSClassFromString(self.paramDic[@"className"]);
        vc = [[className alloc]initWithParamDic:@{@"index":@(i)}];
        [vcs addObject:vc];
    }
    [self.contentView reloadViewWithChildVcs:vcs parentVC:self];
    self.titleView.selectedIndex = 0;
    self.contentView.currentIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
