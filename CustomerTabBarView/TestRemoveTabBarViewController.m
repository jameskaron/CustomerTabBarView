//
//  TestRemoveTabBarViewController.m
//  CustomerTabBarView
//
//  Created by pccw on 10/5/2017.
//  Copyright © 2017 pccw. All rights reserved.
//

#import "TestRemoveTabBarViewController.h"
#import "TabBarController.h"

@interface TestRemoveTabBarViewController ()

@end

@implementation TestRemoveTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [TabBarController hiddenTabBarView];
    [self.tabBarController.tabBar setHidden:YES];
}


@end
