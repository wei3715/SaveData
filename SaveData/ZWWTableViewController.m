//
//  ZWWTableViewController.m
//  MediaTest
//
//  Created by mac on 2018/5/19.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWTableViewController.h"
#import "ZWWTableViewController+method.h"
#import "ZWWSQLiteMoreViewController.h"
@interface ZWWTableViewController ()

@property (nonatomic, strong) NSArray   *sectionTitleArr;
@property (nonatomic, strong) NSArray   *titleArr;

@end

@implementation ZWWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sectionTitleArr = @[@"NSUserDefault",@"SQLite",@"FMDB",@"CoreData",@"钥匙串永久存储数据"];
    _titleArr = @[@[@"01.NSUserDefault:存储自定义对象"],
                  @[@"01.SQLite:创建表&增删改查"],
                  @[@"01.FMDB：创建表&增删改查",@"02.FMDB：线程安全&事务"],
                  @[@"01.CoreData:手动创建CoreData"],
                  @[@"01.钥匙串永久存储数据"]
                  ];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"baseCell"];
    
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _sectionTitleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_titleArr[section]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"baseCell" forIndexPath:indexPath];
    cell.textLabel.text = _titleArr[indexPath.section][indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *titleLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 40)];
    titleLB.backgroundColor = [UIColor cyanColor];
    [titleLB setTextAlignment:NSTextAlignmentCenter];
    titleLB.text = _sectionTitleArr[section];
    [titleLB setTextColor:[UIColor blackColor]];
    
    return titleLB;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{//NSUserDefaults
            switch (indexPath.row) {
                case 0:{
                    [self archiverAction];
                    break;
                }
                    
                default:
                    break;
            }
            
            break;
            
        }
        case 1:{//SQLite
            switch (indexPath.row) {
                case 0:{
                    ZWWSQLiteMoreViewController *sqlLiteMoreVC = [[ZWWSQLiteMoreViewController alloc]init];
                    [self.navigationController pushViewController:sqlLiteMoreVC animated:YES];
                    break;
                }
                    
                default:
                    break;
            }

            break;
            
        }
        case 2:{//FMDB
            switch (indexPath.row) {
                case 0:{
                    ZWWSQLiteMoreViewController *sqlLiteMoreVC = [[ZWWSQLiteMoreViewController alloc]init];
                    [self.navigationController pushViewController:sqlLiteMoreVC animated:YES];
                    break;
                }
                    
                default:
                    break;
            }
            
            break;
            
        }
        case 3:{//CoreData
            switch (indexPath.row) {
                case 0:{
                    ZWWSQLiteMoreViewController *sqlLiteMoreVC = [[ZWWSQLiteMoreViewController alloc]init];
                    [self.navigationController pushViewController:sqlLiteMoreVC animated:YES];
                    break;
                }
                    
                default:
                    break;
            }
            
            break;
            
        }
        case 4:{//钥匙串永久存储数据
            switch (indexPath.row) {
                case 0:{
                    //单类实例化调用
//                    [self testKechainSaveDate];
                    
                    //类方法调用
                    [self testZWWKechainManagerSaveDate];
                    break;
                }
                    
                default:
                    break;
            }
            
            break;
            
        }
            
        default:
            break;
    }
}

@end
