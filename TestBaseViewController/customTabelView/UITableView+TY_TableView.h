//
//  UITableView+TY_TableView.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TY_HeaderFooterView.h"


@class TY_TableViewSection;

@interface UITableView (TY_TableView)

#pragma mark - 相关属性
//控制器
@property (nonatomic, weak) UIViewController * ty_viewController;

//header代理
@property (nonatomic, weak) id<TYHeaderFooterViewDelegate> ty_headerFooterViewDelegate;

#pragma mark - 类方法
+ (instancetype)TY_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;

#pragma mark - 注册cell
- (void)ty_registerCellClass:(Class)cellClass;

#pragma mark - 注册headerFooter
- (void)ty_registerHeaderFooterClass:(Class)headerFooterClass;

#pragma mark - section 和 item 相关
- (void)ty_addSection:(TY_TableViewSection *)section;
- (void)ty_addItems:(NSArray *)items atSection:(NSInteger)section;

#pragma mark - headerFooter相关
- (UIView *)ty_viewForHeaderInSection:(NSInteger)section;
- (CGFloat)ty_heightForHeaderInSection:(NSInteger)section;

- (UIView *)ty_viewForFooterInSection:(NSInteger)section;
- (CGFloat)ty_heightForFooterInSection:(NSInteger)section;


#pragma mark - 点击响应
- (void)ty_cellDidSelectedWithIndexPath:(NSIndexPath *)indexPath;
@end
