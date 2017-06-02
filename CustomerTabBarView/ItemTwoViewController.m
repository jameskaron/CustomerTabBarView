//
//  ItemTwoViewController.m
//  CustomerTabBarView
//
//  Created by pccw on 22/5/2017.
//  Copyright © 2017 pccw. All rights reserved.
//

#import "ItemTwoViewController.h"
#import "MenuTableTableViewController.h"

#define screen_height [UIScreen mainScreen].bounds.size.height

@interface ItemTwoViewController ()<DropDownMenuDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dropDownMenuTextView;

@property (nonatomic) NSArray *dataSource;

@property (nonatomic) MenuTableTableViewController *dropDownMenuTable;

@end

@implementation ItemTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    _dropDownMenuTable = [[MenuTableTableViewController alloc]init];
    // 设置弹出菜单的代理为当前这个类
    _dropDownMenuTable.dropDownMenuDelegate = self;
    // 数据传给下拉列表类，作为表格的数据源
    _dropDownMenuTable.dataSource = _dataSource;
    // 将下拉列表作为子页面添加到当前视图，同时添加子控制器
    [self addChildViewController:_dropDownMenuTable];
    [self.view addSubview:_dropDownMenuTable.view];
    
    // 根据显示框尺寸设置弹出菜单的位置和尺寸
    CGFloat textView_x      = _dropDownMenuTextView.frame.origin.x;
    CGFloat textView_y      = _dropDownMenuTextView.frame.origin.y;
    CGFloat textView_width  = _dropDownMenuTextView.frame.size.width;
    CGFloat textView_height = _dropDownMenuTextView.frame.size.height;
    
    _dropDownMenuTable.view.frame = CGRectMake(textView_x, textView_y + textView_height, textView_width, 0.15*screen_height);
    
}


-(void)initData{
    _dataSource = @[@"1",@"2",@"3",@"4",@"5"];
}

- (IBAction)openDropDownMenu:(UIButton *)sender {
    _dropDownMenuTable.isOpen = !_dropDownMenuTable.isOpen;
    [_dropDownMenuTable.tableView reloadData];
    //处理滚动条
    [_dropDownMenuTable.tableView performSelector:@selector(flashScrollIndicators) withObject:nil afterDelay:0];
}


/**
 * 选定cell获取选中账号的代理监听
 */
- (void)selectedCell:(NSInteger)index {
    // 更新当前选中账号
    _dropDownMenuTextView.text = [_dataSource objectAtIndex:index];
    
    //close table view
    _dropDownMenuTable.isOpen = NO;
    [_dropDownMenuTable.tableView reloadData];
    
}


@end
