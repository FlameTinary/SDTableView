//
//  TY_DataSourcce.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TY_TableViewSection;

@interface TY_DataSourcce : NSObject<UITableViewDataSource>

//section
@property (nonatomic, strong) NSMutableArray<TY_TableViewSection *> *sections;

#pragma mark - section 和 item 相关
- (void)addSection:(TY_TableViewSection *)section;
- (void)addItems:(NSArray *)items atSection:(NSInteger)section;

@end
