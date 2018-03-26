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

@interface TY_ExampleViewController ()
//item数组
@property (nonatomic, strong) NSArray *itemArr;
@end

@implementation TY_ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    //请求网络
    [self netWorking];
}

#pragma mark - 网路请求
- (void)netWorking
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //模拟数据
        //第一组
        TY_TableViewItem * item1 = [TY_TableViewItem itemWithReuseIdentifier:@"TY_ExampleOneCell" andData:[NSString stringWithFormat:@"第一组的item1"]];
        TY_TableViewItem * item2 = [TY_TableViewItem itemWithReuseIdentifier:@"TY_ExampleTwoCell" andData:[NSString stringWithFormat:@"第一组的item2"]];
        
        TY_TableViewSection * section1 = [TY_TableViewSection sectionWithTitle:@"第一组" andDataArr:[NSArray arrayWithObjects:item1, item2, nil]];
        
        //第二组
        TY_TableViewItem * item3 = [TY_TableViewItem itemWithReuseIdentifier:@"TY_ExampleOneCell" andData:[NSString stringWithFormat:@"第二组的item1"]];
        TY_TableViewItem * item4 = [TY_TableViewItem itemWithReuseIdentifier:@"TY_ExampleTwoCell" andData:[NSString stringWithFormat:@"第二组的item2"]];
        
        TY_TableViewSection * section2 = [TY_TableViewSection sectionWithTitle:@"第二组" andDataArr:[NSArray arrayWithObjects:item3, item4, nil]];
        
        //给itemArr赋值
        _itemArr = [NSArray arrayWithObjects:section1, section2, nil];
        
        //更新tableView
        [self setupExampleContent];
        
    });
}

- (void)configTableView:(UITableView *)tableView
{
    tableView.rowHeight = 55;
    [tableView ty_registerCellClass:[TY_ExampleOneCell class]];
    [tableView ty_registerCellClass:[TY_ExampleTwoCell class]];
}

- (void)setupExampleContent
{
    //NSArray *itemList = @[[TY_ExampleListItem itemWithTitle:@"1. 头部点击缩放" subTitle:nil object:nil],
      //                    [TY_ExampleListItem itemWithTitle:@"2. Cell事件响应" subTitle:nil object:nil],
        //                  [TY_ExampleListItem itemWithTitle:@"3. 混合Cell" subTitle:nil object:nil]];
    //_itemArr = itemList;
    [self.tableView cellWith:self.itemArr];
    //[self.tableView ty_addItems:itemList atSection:0];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"点击了第%ld组，第%ld行", (long)indexPath.section, (long)indexPath.row);
    [self.tableView ty_cellDidSelectedWithIndexPath:indexPath];
}

@end
