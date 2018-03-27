//
//  TY_ExampleTwoCell.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_ExampleTwoCell.h"

#import "TY_ExampleListItem.h"

@interface TY_ExampleTwoCell()
//label
@property (nonatomic, strong) UILabel * titleLabel;
@end
@implementation TY_ExampleTwoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0, 10, 100, 20);
        titleLabel.text = @"第二种cell";
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UILabel * subLabel = [[UILabel alloc] init];
        subLabel.frame = CGRectMake(0, 30, 50, 12);
        subLabel.text = @"11";
        [self.contentView addSubview:subLabel];
    }
    return self;
}

- (void)setupData:(id)data
{
    TY_ExampleListItem * item = (TY_ExampleListItem *)data;
    self.titleLabel.text = item.title;
    
}
- (void)selectedEvent {
    NSLog(@"点击了TY_ExampleTwoCell");
}
@end
