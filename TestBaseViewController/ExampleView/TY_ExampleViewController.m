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
    
    // 添加一个section
    TY_TableViewSection * section = [[TY_TableViewSection alloc] initWithCellClass:[TY_ExampleOneCell class]];
    [tableView ty_addSection:section];
    
}

- (void)setupExampleContent
{
    [self.tableView ty_addItems:self.itemArr atSection:0];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView ty_cellDidSelectedWithIndexPath:indexPath];
}

@end
