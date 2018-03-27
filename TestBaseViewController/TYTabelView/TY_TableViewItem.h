//
//  TY_TableViewItem.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TY_TableViewItem : NSObject

#pragma mark - 相关属性
//cellID
@property (nonatomic, copy) NSString * cellReuseIdentifier;
//data
@property (nonatomic, strong) id data;

#pragma mark - 类方法
+ (instancetype)itemWithReuseIdentifier:(NSString *)cellReuseIdentifier andData:(id)data;

@end
