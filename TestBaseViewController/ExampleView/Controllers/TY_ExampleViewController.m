//
//  TY_ExampleViewController.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_ExampleViewController.h"
#import "TY_ExampleOneCell.h"
#import "TY_ExampleTwoCell.h"
#import "TY_TableViewSection.h"
#import "TY_ExampleListItem.h"
#import "TY_SecExampleViewController.h"

#import "TY_ExampleHeaderView.h"
#import "TY_ExampleFooterView.h"

@interface TY_ExampleViewController ()
//item数组
@property (nonatomic, strong) NSArray *itemArr;
@end

@implementation TY_ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    [self setupTableView];
    
    //请求网络
    [self netWorking];
}

#pragma mark - 网路请求
- (void)netWorking
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //模拟数据
        NSArray *itemList = @[[TY_ExampleListItem itemWithTitle:@"1. 头部点击缩放" subTitle:nil object:[TY_SecExampleViewController class]],
                              [TY_ExampleListItem itemWithTitle:@"2. Cell事件响应" subTitle:nil object:[TY_SecExampleViewController class]],
                              [TY_ExampleListItem itemWithTitle:@"3. 混合Cell" subTitle:nil object:[TY_SecExampleViewController class]]];
        _itemArr = itemList;
        //更新tableView
        [self setupExampleContent];
        
    });
}

- (void)configTableView:(UITableView *)tableView
{
    tableView.rowHeight = 55;
    // 注册cell
    [tableView ty_registerCellClass:[TY_ExampleOneCell class]];
    [tableView ty_registerCellClass:[TY_ExampleTwoCell class]];
    
    [tableView ty_registerHeaderFooterClass:[TY_ExampleHeaderView class]];
    [tableView ty_registerHeaderFooterClass:[TY_ExampleFooterView class]];
}

- (void)setupExampleContent
{
    // 添加section0
    TY_TableViewSection * section0 = [[TY_TableViewSection alloc] initWithCellClass:[TY_ExampleOneCell class] headerClass:[TY_ExampleHeaderView class]];
    section0.headerHeight = 44;
    [self.tableView ty_addSection:section0];
    [self.tableView ty_addItems:self.itemArr atSection:0];
    
    // 添加section1
    TY_TableViewSection * section1 = [[TY_TableViewSection alloc] initWithCellClass:[TY_ExampleTwoCell class] headerClass:[TY_ExampleHeaderView class]];
    section1.headerHeight = 44;
    [self.tableView ty_addSection:section1];
    [self.tableView ty_addItems:self.itemArr atSection:1];
    
    // 添加section2
    TY_TableViewSection * section2 = [[TY_TableViewSection alloc] initWithCellClass:[TY_ExampleTwoCell class] headerClass:[TY_ExampleHeaderView class] footerClass:[TY_ExampleFooterView class]];
    section2.headerHeight = 44;
    section2.footerHeight = 66;
    [self.tableView ty_addSection:section2];
    [self.tableView ty_addItems:self.itemArr atSection:2];

}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self.tableView ty_viewForHeaderInSection:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [self.tableView ty_heightForHeaderInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [self.tableView ty_viewForFooterInSection:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [self.tableView ty_heightForFooterInSection:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView ty_cellDidSelectedWithIndexPath:indexPath];
}

@end
