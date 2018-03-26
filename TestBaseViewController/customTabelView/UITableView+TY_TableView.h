//
//  UITableView+TY_TableView.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TY_TableViewSection;

@interface UITableView (TY_TableView)

//控制器
//@property (nonatomic, weak) UIViewController * ty_viewController;

+ (instancetype)TY_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;
- (void)ty_registerCellClass:(Class)cellClass;
- (void)cellWith:(NSArray<TY_TableViewSection *> *)cellArr;
- (void)ty_addItems:(NSArray *)items atSection:(NSInteger)section;
- (void)ty_cellDidSelectedWithIndexPath:(NSIndexPath *)indexPath;
@end
