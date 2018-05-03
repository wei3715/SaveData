//
//  ALTTHomeViewController.m
//  ALTT
//
//  Created by mac on 2018/4/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTMineViewController.h"
#import "ZSHGoodsMineGridCell.h"
#import "ZSHGoodMineReusableView.h"
static NSString *cellIdentifier = @"cellId";
static NSString *headerViewIdentifier = @"hederview";

@interface ALTTMineViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImageView *topIV;

@property (nonatomic, strong) NSArray        *sectionTitleArr;
@property (nonatomic, strong) NSArray        *dataArr;
@property (nonatomic, strong) NSArray        *pushVCsArr;
@property (nonatomic, strong) NSArray        *paramArr;
@property (nonatomic, strong) UIButton       *titleBtn;

@end

@implementation ALTTMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
    [self createUI];
}

- (void)loadData{
    [self changeDataSource:0];
}


- (void)createUI{
    
    self.isHidenNaviBar = YES;
    [self.view addSubview:self.topIV];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSize = CGSizeMake(KScreenWidth/5, kRealValue(94));
    layout.headerReferenceSize = CGSizeMake(kScreenWidth, kRealValue(40));
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topIV.mas_bottom);
        make.bottom.mas_equalTo(self.view);
        make.left.right.mas_equalTo(self.view);
    }];
    self.collectionView.scrollEnabled = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[ZSHGoodsMineGridCell class] forCellWithReuseIdentifier:cellIdentifier];
    [self.collectionView registerClass:[ZSHGoodMineReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
    
//    CGFloat top =  layout.headerReferenceSize.height + layout.itemSize.height;
//    CGFloat sectionHeight = layout.headerReferenceSize.height + layout.itemSize.height;
//    for (int i = 0; i<self.sectionTitleArr.count; i++) {
//        UIView *horizontalLine = [[UIView alloc]initWithFrame:CGRectMake(0,top + i*sectionHeight,KScreenWidth,0.5)];
//        horizontalLine.backgroundColor = [UIColor colorWithHexString:@"1D1D1D"];
//        [self.collectionView addSubview:horizontalLine];
//    }
}

#pragma collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataArr[section]count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    ZSHGoodsMineGridCell *cell = (ZSHGoodsMineGridCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    NSDictionary *dicData = self.dataArr[indexPath.section][indexPath.row];
    cell.modelDic = dicData;
    cell.btnClickBlock = ^(UIButton *btn){
        //        if (indexPath.section == 1 && btn.tag-1 == 2) {//地址管理
        //            RootWebViewController *addressListVC = [RootViewController alloc]INI;
        //        }
        Class className = NSClassFromString(weakself.pushVCsArr[indexPath.section][btn.tag-1]);
        RootViewController *vc = [[className alloc]initWithParamDic:weakself.paramArr[indexPath.section][btn.tag-1]];
        [weakself.navigationController pushViewController:vc animated:YES];
    };
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        ZSHGoodMineReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIdentifier forIndexPath:indexPath];
        [header updateWithTitle:self.sectionTitleArr[indexPath.section]];
        if (indexPath.section == 0) {
            header.rightBtn.hidden = NO;
            header.rightBtnBlock = ^(NSInteger tag) {
                RLog(@"点击全部订单");
            };
        }
        header.userInteractionEnabled = YES;
        header.tag = indexPath.section + 1;
        [header addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewAction:)]];
        return header;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableDictionary *dicData = self.dataArr[indexPath.row];
    dicData[@"desc"] = @"你点击了我";
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    RLog(@"didSelectItemAtIndexPath:, indexPath.row=%ld ", (long)indexPath.row);
}

- (void)headViewAction:(UITapGestureRecognizer *)gesture{
    if (gesture.view.tag == 1) {//我的订单
//        [self changeDataSource:0];
    }
}

// 切换数据源
- (void)changeDataSource:(NSInteger )index {
    if (index == 0) {
        self.sectionTitleArr = @[@"我的订单",@"必备工具"];
        self.dataArr = @[
                         @[@{@"image":@"my_icon_1",@"desc":@"待付款", @"tag":@(1)},
                           @{@"image":@"my_icon_2",@"desc":@"待发货",@"tag":@(2)},
                           @{@"image":@"my_icon_3",@"desc":@"待收货",@"tag":@(3)},
                           @{@"image":@"my_icon_4",@"desc":@"待评价",@"tag":@(4)},
                           @{@"image":@"my_icon_5",@"desc":@"退款售后",@"tag":@(5)}],
                         @[@{@"image":@"my_icon_6",@"desc":@"我的钱包",@"tag":@(1)},
                           @{@"image":@"my_icon_7",@"desc":@"我的好友",@"tag":@(2)},
                           @{@"image":@"my_icon_8",@"desc":@"我的活动",@"tag":@(3)},
                           @{@"image":@"my_icon_9",@"desc":@"创客中心",@"tag":@(4)},
                           @{@"image":@"my_icon_10",@"desc":@"宝石排行",@"tag":@(5)},
                           @{@"image":@"my_icon_11",@"desc":@"获取能量",@"tag":@(6)},
                           @{@"image":@"my_icon_12",@"desc":@"设置",@"tag":@(7)}]
                         ];
        
        
        self.pushVCsArr = @[
                            @[@"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController"],
                            
                            
                            @[@"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController",
                              @"ALTTSingleImgViewController"]
                            ];
        self.paramArr = @[@[@{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"}],
                          @[@{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            @{@"bgImg":@"star_bj_1",@"title":@"订单"},
                            ]
                          ];
        
    }
}

- (UIImageView *)topIV{
    if (!_topIV) {
        _topIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kRealValue(150))];
        _topIV.image = [UIImage imageNamed:@"my_image_1"];
    }
    return _topIV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
