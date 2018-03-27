//
//  TY_TableViewConfig.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/27.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TYHeaderFooterViewDelegate;

@interface TY_TableViewConfig : NSObject
//控制器
@property (nonatomic, weak) UIViewController * viewController;

//header代理
@property (nonatomic, weak) id<TYHeaderFooterViewDelegate> headerFooterViewDelegate;

+ (instancetype)sharedConfig;
@end
