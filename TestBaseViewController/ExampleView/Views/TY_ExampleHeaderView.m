
//
//  TY_ExampleHeaderView.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/27.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_ExampleHeaderView.h"

@interface TY_ExampleHeaderView()
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation TY_ExampleHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 20)];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
    }
    return self;
}

- (void)setupData:(id)data
{
    self.titleLabel.text = [NSString stringWithFormat:@"header:%@",(NSString *)data];
}

@end
