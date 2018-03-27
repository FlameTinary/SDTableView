//
//  TY_TableViewSection.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_TableViewSection.h"
#import "TY_TableViewCell.h"

@interface TY_TableViewSection ()
{
    Class _cellClass;
}
@end

@implementation TY_TableViewSection

- (instancetype)initWithCellClass:(Class)cellClass
{
    if (self = [super init]) {
        _cellClass = cellClass;
    }
    return self;
}

+(instancetype)sectionWithTitle:(NSString *)title andDataArr:(NSArray<TY_TableViewItem *> *)sectionArr
{
    TY_TableViewSection * section = [TY_TableViewSection new];
    section.sectionTitle = title;
    section.sectionArr = sectionArr;
    return section;
}

#pragma mark - 添加内容
- (void)addItems:(NSArray *)items
{
    if (!items) {
        return;
    }
    
    NSMutableArray<TY_TableViewItem *> *dataAdapterItems = [NSMutableArray arrayWithArray:self.sectionArr];
    for (id item in items) {
        if ([item isKindOfClass:[TY_TableViewItem class]]) {
            [dataAdapterItems addObject:item];
        } else if (_cellClass) {
            TY_TableViewItem * tempItem = [TY_TableViewItem itemWithReuseIdentifier:NSStringFromClass(_cellClass) andData:item];
            [dataAdapterItems addObject:tempItem];
        }
    }
    
    self.sectionArr = dataAdapterItems;
}

@end
