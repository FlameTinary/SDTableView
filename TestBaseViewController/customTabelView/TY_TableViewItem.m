//
//  TY_TableViewItem.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_TableViewItem.h"

@implementation TY_TableViewItem

+(instancetype)itemWithReuseIdentifier:(NSString *)cellReuseIdentifier andData:(id)data
{
    TY_TableViewItem * item = [TY_TableViewItem new];
    item.cellReuseIdentifier = cellReuseIdentifier;
    item.data = data;
    return item;
}

@end
