//
//  TY_TableViewSection.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_TableViewSection.h"

@implementation TY_TableViewSection

+(instancetype)sectionWithTitle:(NSString *)title andDataArr:(NSArray<TY_TableViewItem *> *)sectionArr
{
    TY_TableViewSection * section = [TY_TableViewSection new];
    section.sectionTitle = title;
    section.sectionArr = sectionArr;
    return section;
}

@end
