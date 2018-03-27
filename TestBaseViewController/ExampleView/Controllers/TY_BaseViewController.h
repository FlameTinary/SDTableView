//
//  TY_BaseViewController.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+TY_TableView.h"

@interface TY_BaseViewController : UIViewController<UITableViewDelegate>

#pragma mark - 属性
//tableView
@property (nonatomic, strong) UITableView *tableView;

#pragma mark - 设置tableView
- (void)setupTableView;
- (void)configTableView:(UITableView *)tableView;
- (void)setupExampleContent;
@end
