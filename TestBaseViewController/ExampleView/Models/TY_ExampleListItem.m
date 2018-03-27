//
//  TY_ExampleListItem.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_ExampleListItem.h"

@implementation TY_ExampleListItem

+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle object:(id)object
{
    TY_ExampleListItem * item = [TY_ExampleListItem new];
    item.title = title;
    item.subTitle = subTitle;
    item.object = object;
    return item;
}

@end
