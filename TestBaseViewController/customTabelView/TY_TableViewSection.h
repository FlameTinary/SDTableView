//
//  TY_TableViewSection.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TY_TableViewItem.h"

@interface TY_TableViewSection : NSObject

//title
@property (nonatomic, copy) NSString * sectionTitle;

//组内容
@property (nonatomic, strong) NSArray<TY_TableViewItem *> * sectionArr;

+ (instancetype)sectionWithTitle:(NSString *)title andDataArr:(NSArray<TY_TableViewItem *> *) sectionArr;

@end
