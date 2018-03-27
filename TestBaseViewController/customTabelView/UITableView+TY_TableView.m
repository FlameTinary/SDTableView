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
#import "TY_HeaderFooterView.h"
#import "TY_TableViewSection.h"

static char kSTDTableViewDataSourceIdentifyKey;
static char kSTDTableViewControllerKey;

@interface UITableView()
//dataSoutce
@property (nonatomic, strong) TY_DataSourcce * ty_dataSource;

@end

@implementation UITableView (TY_TableView)

#pragma mark - setter 和 getter
- (void)setTy_viewController:(UIViewController *)ty_viewController
{
    objc_setAssociatedObject(self, &kSTDTableViewControllerKey, ty_viewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIViewController *)ty_viewController
{
    return objc_getAssociatedObject(self, &kSTDTableViewControllerKey);
}

- (void)setTy_dataSource:(TY_DataSourcce *)ty_dataSource
{
    objc_setAssociatedObject(self, &kSTDTableViewDataSourceIdentifyKey, ty_dataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.dataSource = ty_dataSource;
}

- (TY_DataSourcce *)ty_dataSource
{
    return objc_getAssociatedObject(self, &kSTDTableViewDataSourceIdentifyKey);
}

#pragma mark - 类方法
+ (instancetype)TY_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [tableView ty_createDataSource];
    return tableView;
}



#pragma mark - 注册cell
- (void)ty_registerCellClass:(Class)cellClass
{
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

#pragma mark - 注册headerFooter
- (void)ty_registerHeaderFooterClass:(Class)headerFooterClass
{
    [self registerClass:headerFooterClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(headerFooterClass)];
}

#pragma mark - section 和 item 相关
- (void)ty_addSection:(TY_TableViewSection *)section
{
    [self.ty_dataSource addSection:section];
    [self reloadData];
}

- (void)ty_addItems:(NSArray *)items atSection:(NSInteger)section
{
    [self.ty_dataSource addItems:items atSection:section];
    [self reloadData];
}

#pragma mark - headerFooter相关
- (UIView *)ty_viewForHeaderInSection:(NSInteger)section
{
    NSArray *sectionArr = self.ty_dataSource.sections.copy;
    TY_TableViewSection * tempSec = sectionArr[section];
    TY_HeaderFooterView *headerView = [self dequeueReusableHeaderFooterViewWithIdentifier:tempSec.sectionHeaderIdentifier];
    [headerView setupData:[NSString stringWithFormat:@"第%ld组", section]];
    return headerView;
}
- (CGFloat)ty_heightForHeaderInSection:(NSInteger)section
{
    NSArray *sectionArr = self.ty_dataSource.sections.copy;
    TY_TableViewSection * tempSec = sectionArr[section];
    return tempSec.headerHeight;
}

- (UIView *)ty_viewForFooterInSection:(NSInteger)section
{
    NSArray *sectionArr = self.ty_dataSource.sections.copy;
    TY_TableViewSection * tempSec = sectionArr[section];
    TY_HeaderFooterView *headerView = [self dequeueReusableHeaderFooterViewWithIdentifier:tempSec.sectionFooterIdentifier];
    [headerView setupData:[NSString stringWithFormat:@"第%ld组", section]];
    return headerView;
}
- (CGFloat)ty_heightForFooterInSection:(NSInteger)section
{
    NSArray *sectionArr = self.ty_dataSource.sections.copy;
    TY_TableViewSection * tempSec = sectionArr[section];
    return tempSec.footerHeight;
}


#pragma mark - 点击响应
- (void)ty_cellDidSelectedWithIndexPath:(NSIndexPath *)indexPath
{
    TY_TableViewCell * cell = (TY_TableViewCell *)[self cellForRowAtIndexPath:indexPath];
    cell.viewController = self.ty_viewController;
    [cell selectedEvent];
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
