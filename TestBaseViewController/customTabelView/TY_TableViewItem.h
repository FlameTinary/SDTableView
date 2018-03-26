//
//  TY_TableViewItem.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TY_TableViewItem : NSObject

//cellID
@property (nonatomic, copy) NSString * cellReuseIdentifier;
//data
@property (nonatomic, strong) id data;

+ (instancetype)itemWithReuseIdentifier:(NSString *)cellReuseIdentifier andData:(id)data;

@end
