//
//  MenuTableTableViewController.m
//  CustomerTabBarView
//
//  Created by pccw on 22/5/2017.
//  Copyright © 2017 pccw. All rights reserved.
//

#import "MenuTableTableViewController.h"

@interface MenuTableTableViewController ()


@end

@implementation MenuTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 背景透明
    self.view.backgroundColor = [UIColor whiteColor];
    // 清除多余的分割线
    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    // 默认关闭下拉列表
    _isOpen = NO;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // 展开与隐藏账号列表
    if(_isOpen)
        return _dataSource.count;
    else
        return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *specialId = @"id";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:specialId];
    // 添加数据源
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //通知代理
    [_dropDownMenuDelegate selectedCell:indexPath.row];
    
    
}



@end
