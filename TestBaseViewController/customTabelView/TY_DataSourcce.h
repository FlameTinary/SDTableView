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

//cell数组
@property (nonatomic, strong) NSArray<TY_TableViewSection *> * cellArr;

- (void)addItems:(NSArray *)items atSection:(NSInteger)section;

@end
