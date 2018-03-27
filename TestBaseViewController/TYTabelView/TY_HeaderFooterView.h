//
//  TY_HeaderFooterView.h
//  TestBaseViewController
//
//  Created by user001 on 2018/3/27.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TYHeaderFooterViewDelegate <NSObject>

@optional
- (void)tableViewHeaderFooterView:(UITableViewHeaderFooterView *)headerFooterView event:(id)event;

@end

@interface TY_HeaderFooterView : UITableViewHeaderFooterView

//delegate
@property (nonatomic, weak) id<TYHeaderFooterViewDelegate> delegate;

- (void)setupData:(id)data;

@end
