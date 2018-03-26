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
//section
@property (nonatomic, strong) NSMutableArray<TY_TableViewSection *> *section;
@end

@implementation TY_DataSourcce

- (void)addItems:(NSArray *)items atSection:(NSInteger)section
{
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_cellArr && _cellArr.count > 0) {
        return _cellArr.count;
    } else {
        return 0;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_cellArr && _cellArr.count > 0) {
        return _cellArr[section].sectionArr.count;
    } else {
        return 0;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TY_TableViewSection *section = _cellArr[indexPath.section];
    TY_TableViewItem * item = section.sectionArr[indexPath.row];
    
    TY_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.cellReuseIdentifier];
    if (!cell) {
        cell = [[TY_TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:item.cellReuseIdentifier];
    }
    [cell setupData:item.data];
    return cell;
}

@end
