//
//  TY_BaseViewController.m
//  TestBaseViewController
//
//  Created by user001 on 2018/3/26.
//  Copyright © 2018年 GeneTimeCoin. All rights reserved.
//

#import "TY_BaseViewController.h"


@interface TY_BaseViewController ()
@end

@implementation TY_BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
}

#pragma mark - 设置tableView
- (void)setupTableView{
    _tableView = [UITableView TY_tableViewWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.ty_viewController = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self configTableView:_tableView];
    [self.view addSubview:_tableView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:@{@"tableView":_tableView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:@{@"tableView":_tableView}]];
}
- (void)configTableView:(UITableView *)tableView
{
    
}
- (void)setupExampleContent
{
    
}
#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"收到内存警告");
}

@end
