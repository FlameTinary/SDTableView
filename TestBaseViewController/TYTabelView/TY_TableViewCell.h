//
//  TY_TableViewCell.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TY_TableViewCell : UITableViewCell

#pragma mark - 相关属性
//控制器
@property (nonatomic, weak) UIViewController * viewController;

#pragma mark - 设置数据
- (void)setupData:(id)data;

#pragma mark - 设置数据
- (void)selectedEvent;
@end
