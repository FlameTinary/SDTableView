# TYTableView（请勿使用）
## 一、简介
封装的tableView，减少控制器中tableView相关的代码
## 二、TY_TableView分类中的API

### 生成tableView的类方法

```
+ (instancetype)TY_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;
```
例如：

```
- (void)setupTableView{
    _tableView = [UITableView TY_tableViewWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    //_tableView.ty_viewController = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self configTableView:_tableView];
    [self.view addSubview:_tableView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:@{@"tableView":_tableView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:@{@"tableView":_tableView}]];
}
```

### 注册cell

```
- (void)ty_registerCellClass:(Class)cellClass;
```

例如：

```
[tableView ty_registerCellClass:[TY_ExampleOneCell class]];
```

### 将数据赋值cell

```
- (void)cellWith:(NSArray<TY_TableViewSection *> *)cellArr;
```

例如：

```
[self.tableView cellWith:self.itemArr];
```

### 为tableView添加items

```
- (void)ty_addItems:(NSArray *)items atSection:(NSInteger)section;
```

### cell的点击

```
- (void)ty_cellDidSelectedWithIndexPath:(NSIndexPath *)indexPath;
```

