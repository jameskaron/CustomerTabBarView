//
//  MenuTableTableViewController.h
//  CustomerTabBarView
//
//  Created by pccw on 22/5/2017.
//  Copyright © 2017 pccw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DropDownMenuDelegate <NSObject>
/**
 * 选中cell的代理事件
 */
- (void) selectedCell:(NSInteger)index;

/**
 *  更新下拉菜单的高度
 */
//- (void) updateListH;

@end

@interface MenuTableTableViewController : UITableViewController

@property (nonatomic) BOOL isOpen;

@property (nonatomic) NSArray *dataSource;

@property (nonatomic,weak) id<DropDownMenuDelegate>dropDownMenuDelegate;


@end
