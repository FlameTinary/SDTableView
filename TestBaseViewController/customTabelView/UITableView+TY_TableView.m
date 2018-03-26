//
//  UITableView+TY_TableView.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "UITableView+TY_TableView.h"
#import <objc/runtime.h>
#import "TY_DataSourcce.h"
#import "TY_TableViewCell.h"

static char kSTDTableViewDataSourceIdentifyKey;

@interface UITableView()
//dataSoutce
@property (nonatomic, strong) TY_DataSourcce * ty_dataSource;

@end

@implementation UITableView (TY_TableView)
- (void)setTy_dataSource:(TY_DataSourcce *)ty_dataSource
{
    objc_setAssociatedObject(self, &kSTDTableViewDataSourceIdentifyKey, ty_dataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.dataSource = ty_dataSource;
}

- (TY_DataSourcce *)ty_dataSource
{
    return objc_getAssociatedObject(self, &kSTDTableViewDataSourceIdentifyKey);
}

+ (instancetype)TY_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [tableView ty_createDataSource];
    return tableView;
}

#pragma mark - register
- (void)ty_registerCellClass:(Class)cellClass
{
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

#pragma mark - 获取cellArr
- (void)cellWith:(NSArray<TY_TableViewSection *> *)cellArr
{
    self.ty_dataSource.cellArr = cellArr;
    [self reloadData];
}

- (void)ty_addItems:(NSArray *)items atSection:(NSInteger)section
{
    [self.ty_dataSource addItems:items atSection:section];
}

#pragma mark - selected
- (void)ty_cellDidSelectedWithIndexPath:(NSIndexPath *)indexPath
{
    [(TY_TableViewCell *)[self cellForRowAtIndexPath:indexPath] selectedEvent];
}

#pragma mark - dataSource
- (void)ty_createDataSource
{
    TY_DataSourcce *dataSource = [[TY_DataSourcce alloc] init];
    [self configDataSource:dataSource];
}
- (void)configDataSource:(TY_DataSourcce *)dataSource
{
    self.ty_dataSource = dataSource;
}



@end
