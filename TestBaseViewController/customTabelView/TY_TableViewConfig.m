//
//  TY_TableViewConfig.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/27.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_TableViewConfig.h"

@implementation TY_TableViewConfig

+ (instancetype)sharedConfig
{
    static TY_TableViewConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[TY_TableViewConfig alloc] init];
    });
    
    return config;
}

@end
