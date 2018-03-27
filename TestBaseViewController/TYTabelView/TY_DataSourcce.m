//
//  TY_DataSourcce.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_DataSourcce.h"
#import "TY_TableViewCell.h"
#import "TY_TableViewSection.h"

@interface TY_DataSourcce()

@end

@implementation TY_DataSourcce

#pragma mark - 懒加载section
- (NSMutableArray<TY_TableViewSection *> *)sections
{
    if (!_sections) {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

#pragma mark - section 和 item 相关
- (void)addSection:(TY_TableViewSection *)section
{
    if (!section) {
        return;
    }
    [self.sections addObject:section];
}

- (void)addItems:(NSArray *)items atSection:(NSInteger)section
{
    NSAssert(self.sections.count > section, @"section index '%zd' out of range '0 ~ %zd'", section, self.sections.count - 1);
    if (self.sections.count <= section) {
        return;
    }
    [self.sections[section] addItems:items];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections?self.sections.count : 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sections[section].sectionArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TY_TableViewItem * item = [self itemfromIndexPath:indexPath];
    
    TY_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.cellReuseIdentifier];
    if (!cell) {
        cell = [[TY_TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:item.cellReuseIdentifier];
    }
    [cell setupData:item.data];
    return cell;
}

#pragma mark - 其他方法

// 从section中获取item
- (TY_TableViewItem *)itemfromIndexPath:(NSIndexPath *)indexPath
{
    TY_TableViewSection *section = self.sections[indexPath.section];
    NSArray<TY_TableViewItem *> * items = section.sectionArr;
    TY_TableViewItem * item = items[indexPath.row];
    return item;
}

@end
