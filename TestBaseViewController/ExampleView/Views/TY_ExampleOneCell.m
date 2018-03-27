//
//  TY_ExampleOneCell.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_ExampleOneCell.h"

#import "TY_ExampleListItem.h"

@interface TY_ExampleOneCell()
//data
@property (nonatomic, strong) TY_ExampleListItem * item;
//label
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation TY_ExampleOneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0, 10, 200, 20);
        titleLabel.text = @"第一种cell";
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
    }
    return self;
}

- (void)setupData:(id)data
{
    _item = data;
    self.titleLabel.text = _item.title;
}
- (void)selectedEvent {
    Class class = _item.object;
    [self.viewController.navigationController pushViewController:[class new] animated:YES];
}
@end
