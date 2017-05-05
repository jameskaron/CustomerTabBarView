//
//  ViewController.m
//  CustomerTabBarView
//
//  Created by pccw on 2/5/2017.
//  Copyright © 2017 pccw. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@property(retain,nonatomic) UIView *tab_bar_view;
@property(retain,nonatomic) UIButton *firstButton;
@property(retain,nonatomic) UIButton *secondButton;
@property(retain,nonatomic) UIButton *thirdButton;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTabBarController];
    
    [self initTabBar];
}

-(void)initTabBarController{
    
    UIStoryboard *board = self.storyboard;
    UIViewController *testvc = [board instantiateViewControllerWithIdentifier:@"testvc"];
    UIViewController *testvc2 = [board instantiateViewControllerWithIdentifier:@"testvc2"];
    UIViewController *testvc3 = [board instantiateViewControllerWithIdentifier:@"testvc3"];
    
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:testvc];
    
    [self setViewControllers:@[navi,testvc2,testvc3]];
    
    [self setSelectedViewController:navi];
    
    //    testvc.delegate = self;
    
    NSLog(@"tab bar address:%f,%f,%f,%f",self.tabBar.frame.origin.x,self.tabBar.frame.origin.y,self.tabBar.frame.size.width,self.tabBar.frame.size.height);
    
    [self printData];
}

-(void)printData{
    
    CGFloat navig_bar_x = self.navigationController.navigationBar.bounds.origin.x;
    CGFloat navig_bar_y = self.navigationController.navigationBar.bounds.origin.y;
    CGFloat navig_bar_height = self.navigationController.navigationBar.bounds.size.height;
    NSLog(@"navigation bar x:%f,y:%f,height:%f",navig_bar_x,navig_bar_y,navig_bar_height);
}

-(void)initTabBar{
    CGRect rx = [UIScreen mainScreen].bounds;
    CGFloat screenHeight = rx.size.height;
    CGFloat screenWidth  = rx.size.width;
    NSLog(@"screen width:%f,height:%f:",screenWidth,screenHeight);
    
    
    _tab_bar_view = [[UIView alloc] initWithFrame:CGRectMake(0, screenHeight - 50, screenWidth, 50)];
    
    _tab_bar_view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_tab_bar_view];
    
    _firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self initTabButton:_firstButton title:@"item1" buttonTag:0];
    [self initTabButton:_secondButton title:@"item2" buttonTag:1];
    [self initTabButton:_thirdButton title:@"item3" buttonTag:2];
    
    [_tab_bar_view addSubview:_firstButton];
    [_tab_bar_view addSubview:_secondButton];
    [_tab_bar_view addSubview:_thirdButton];
    
    _firstButton.backgroundColor = [UIColor blackColor];
    
}

-(void)initTabButton:(UIButton*)button title:(NSString *) title buttonTag:(int) i {
    if (i == 0) {
        button.frame = CGRectMake(0, _tab_bar_view.bounds.origin.y, _tab_bar_view.bounds.size.width/3-1, 50);
    }else if(i == 2){
        button.frame = CGRectMake(i * _tab_bar_view.bounds.size.width/3, _tab_bar_view.bounds.origin.y, _tab_bar_view.bounds.size.width/3, 50);
    }else{
        button.frame = CGRectMake(i * _tab_bar_view.bounds.size.width/3, _tab_bar_view.bounds.origin.y, _tab_bar_view.bounds.size.width/3-1, 50);
    }
    button.tag = i;
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

-(void)selectedTab:(UIButton *)button{
    self.selectedIndex = button.tag;
    NSLog(@"button selected state:%i",button.selected);
    if (_firstButton == button) {
        _firstButton.backgroundColor = [UIColor blackColor];
        _secondButton.backgroundColor = [UIColor lightGrayColor];
        _thirdButton.backgroundColor = [UIColor lightGrayColor];
    }else if(_secondButton == button){
        _firstButton.backgroundColor = [UIColor lightGrayColor];
        _secondButton.backgroundColor = [UIColor blackColor];
        _thirdButton.backgroundColor = [UIColor lightGrayColor];
    }else if(_thirdButton == button){
        _firstButton.backgroundColor = [UIColor lightGrayColor];
        _secondButton.backgroundColor = [UIColor lightGrayColor];
        _thirdButton.backgroundColor = [UIColor blackColor];
    }
    
}



@end
