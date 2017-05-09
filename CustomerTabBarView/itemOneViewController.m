//
//  itemOneViewController.m
//  CustomerTabBarView
//
//  Created by pccw on 9/5/2017.
//  Copyright © 2017 pccw. All rights reserved.
//

#import "itemOneViewController.h"
#import "UpperTabBarController.h"

@interface itemOneViewController ()

@end

@implementation itemOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)click2UpperTabBarController:(UIButton *)sender {
    
    UIStoryboard *board = self.storyboard;
    UpperTabBarController *upper_tab_bar_vc = [board instantiateViewControllerWithIdentifier:@"upper_tab_bar_vc"];
    [self.navigationController pushViewController: upper_tab_bar_vc animated:YES];
    
}


@end
