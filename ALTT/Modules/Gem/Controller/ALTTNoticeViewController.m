//
//  ALTTNoticeViewController.m
//  ALTT
//
//  Created by mac on 2018/5/3.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ALTTNoticeViewController.h"
#import "ALTTNoticeCell.h"
@interface ALTTNoticeViewController ()

@property (nonatomic, strong) UIImageView *topIV;
@property (nonatomic, strong) NSArray     *dataArr;

@end

@implementation ALTTNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self createUI];
}

- (void)loadData{
    _dataArr = @[@{@"leftImg":@"notice_icon_1",@"topTitle":@"邀请10名好友",@"bottomTitle":@"邀请1好友+10能量",@"btnTitle":@"+100能量"},
                 @{@"leftImg":@"notice_icon_2",@"topTitle":@"每日登录",@"bottomTitle":@"登录获取能量值",@"btnTitle":@"+1能量"},
                 @{@"leftImg":@"notice_icon_3",@"topTitle":@"每日签到",@"bottomTitle":@"签到获取能量值",@"btnTitle":@"已完成",@"btnImg":@"press"},
                 @{@"leftImg":@"notice_icon_4",@"topTitle":@"购物",@"bottomTitle":@"购物获取能量值",@"btnTitle":@"+5能量"},
                 @{@"leftImg":@"notice_icon_5",@"topTitle":@"浏览资讯",@"bottomTitle":@"邀浏览资讯获取能量",@"btnTitle":@"+1能量"},
                 ];
}

- (void)createUI{
    self.title = @"公告";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(KNavigationBarHeight, 0, KBottomTabH, 0));
    }];
    
    self.tableView.tableHeaderView = self.topIV;
    self.tableView.delegate = self.tableViewModel;
    self.tableView.dataSource = self.tableViewModel;
    
    [self.tableView registerClass:[ALTTNoticeCell class] forCellReuseIdentifier:@"ALTTNoticeCellID"];
    [self initViewModel];
}

- (void)initViewModel {
    [self.tableViewModel.sectionModelArray removeAllObjects];
    [self.tableViewModel.sectionModelArray addObject:[self storeListSection]];
    [self.tableView reloadData];
}

//head
- (ZSHBaseTableViewSectionModel*)storeListSection {
    kWeakSelf(self);
    ZSHBaseTableViewSectionModel *sectionModel = [[ZSHBaseTableViewSectionModel alloc] init];
    for (int i = 0; i<self.dataArr.count; i++) {
        ZSHBaseTableViewCellModel *cellModel = [[ZSHBaseTableViewCellModel alloc] init];
        [sectionModel.cellModelArray addObject:cellModel];
        cellModel.height = kRealValue(60);
        cellModel.renderBlock = ^ZSHBaseCell *(NSIndexPath *indexPath, UITableView *tableView) {
            ALTTNoticeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ALTTNoticeCellID" forIndexPath:indexPath];
            [cell updateCellWithParamDic:weakself.dataArr[indexPath.row]];
            
            return cell;
        };
        
        cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
            if (indexPath.row == 0) {
                ALTTSingleImgViewController *singleVC = [[ALTTSingleImgViewController alloc]initWithParamDic:@{@"bgImg":@"addfriend_bj",@"title":@"邀请码"}];
                [weakself.navigationController pushViewController:singleVC animated:YES];
            }
        };
    }
    
    return sectionModel;
}


- (UIImageView *)topIV{
    if (!_topIV) {
        _topIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star_bj_7"]];
    }
    return _topIV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
