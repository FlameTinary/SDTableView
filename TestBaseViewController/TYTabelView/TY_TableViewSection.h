//
//  TY_TableViewSection.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TY_TableViewItem.h"

@interface TY_TableViewSection : NSObject

#pragma mark - 相关属性
//title
@property (nonatomic, copy) NSString * sectionTitle;

//Identifier
@property (nonatomic, copy) NSString * sectionHeaderIdentifier;
@property (nonatomic, copy) NSString * sectionFooterIdentifier;

//header的高度
@property (nonatomic, assign) NSInteger headerHeight;
//footer的高度
@property (nonatomic, assign) NSInteger footerHeight;

//组内容
@property (nonatomic, strong) NSArray<TY_TableViewItem *> * sectionArr;

#pragma mark - 初始化
- (instancetype)initWithCellClass:(Class)cellClass;
- (instancetype)initWithCellClass:(Class)cellClass headerClass:(Class)headerClass;
- (instancetype)initWithCellClass:(Class)cellClass footerClass:(Class)footerClass;
- (instancetype)initWithCellClass:(Class)cellClass headerClass:(Class)headerClass footerClass:(Class)footerClass;
+ (instancetype)sectionWithTitle:(NSString *)title andDataArr:(NSArray<TY_TableViewItem *> *) sectionArr;

#pragma mark - 添加内容
- (void)addItems:(NSArray *)items;
@end
