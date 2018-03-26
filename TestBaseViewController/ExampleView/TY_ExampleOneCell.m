//
//  TY_ExampleOneCell.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_ExampleOneCell.h"
@interface TY_ExampleOneCell()
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
    self.titleLabel.text = (NSString *)data;
}
- (void)selectedEvent {
    NSLog(@"点击了TY_ExampleOneCell");
}
@end
