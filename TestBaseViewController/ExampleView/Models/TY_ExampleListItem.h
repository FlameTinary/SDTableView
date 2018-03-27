//
//  TY_ExampleListItem.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TY_ExampleListItem : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subTitle;
@property (nonatomic, strong) id object;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle object:(id)object;

@end
