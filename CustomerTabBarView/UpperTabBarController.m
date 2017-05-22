//
//  UpperTabBarController.m
//  CustomerTabBarView
//
//  Created by pccw on 3/5/2017.
//  Copyright © 2017 pccw. All rights reserved.
//

#import "UpperTabBarController.h"
#import "CustomView.h"

#define mainScreen [UIScreen mainScreen].bounds

@interface UpperTabBarController ()

@property(retain,nonatomic) UIView *tab_bar_view;
@property(retain,nonatomic) UIButton *firstButton;
@property(retain,nonatomic) UIButton *secondButton;
@property(retain,nonatomic) UIButton *thirdButton;

@property(retain,nonatomic) UIView *cv;
@property(retain,nonatomic) UIView *cv2;
@property(retain,nonatomic) UIView *cv3;

@property(retain,nonatomic) UIImageView *firstImageView;
@property(retain,nonatomic) UIImageView *secondImageView;
@property(retain,nonatomic) UIImageView *thirdImageView;

@property(retain,nonatomic) UILabel *firstLabel;
@property(retain,nonatomic) UILabel *secondLabel;
@property(retain,nonatomic) UILabel *thirdLabel;

@end

@implementation UpperTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUpperTabBarController];
    
    [self initTabBar];
    
    [self setSelectedButton:_cv2];
    
}

-(void)initUpperTabBarController{
    
    UIStoryboard *board = self.storyboard;
    UIViewController *uppervc = [board instantiateViewControllerWithIdentifier:@"upper_testvc"];
    UIViewController *uppervc2 = [board instantiateViewControllerWithIdentifier:@"upper_testvc2"];
    UIViewController *uppervc3 = [board instantiateViewControllerWithIdentifier:@"upper_testvc3"];
    
//    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:uppervc];
    
    //    testvc.delegate = self;
    [self setViewControllers:@[uppervc,uppervc2,uppervc3]];
    
//    [self setSelectedViewController:uppervc];
    
    
    NSLog(@"tab bar address:%f,%f,%f,%f",self.tabBar.frame.origin.x,self.tabBar.frame.origin.y,self.tabBar.frame.size.width,self.tabBar.frame.size.height);
    self.navigationController.navigationBar.translucent = YES;
    
    [self printData];
}

-(void)printData{
    
    CGFloat navig_bar_x = self.navigationController.navigationBar.bounds.origin.x;
    CGFloat navig_bar_y = self.navigationController.navigationBar.bounds.origin.y;
    CGFloat navig_bar_height = self.navigationController.navigationBar.bounds.size.height;
    NSLog(@"navigation bar x:%f,y:%f,height:%f",navig_bar_x,navig_bar_y,navig_bar_height);
}

-(void)initTabBar{
//    CGRect rx = [UIScreen mainScreen].bounds;
    CGFloat screenHeight = mainScreen.size.height;
    CGFloat screenWidth  = mainScreen.size.width;
    NSLog(@"screen width:%f,height:%f:",screenWidth,screenHeight);
    
    CGFloat navig_bar_height = self.navigationController.navigationBar.bounds.size.height;
    
    _tab_bar_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 120)];
    
    _tab_bar_view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_tab_bar_view];
    
    //button
    _firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self initTabButton:_firstButton  buttonTag:0];
    [self initTabButton:_secondButton buttonTag:1];
    [self initTabButton:_thirdButton  buttonTag:2];
    
    
    [_tab_bar_view addSubview:_firstButton];
    [_tab_bar_view addSubview:_secondButton];
    [_tab_bar_view addSubview:_thirdButton];
    
    //image
    _firstImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"signal_strength_excellent.png"]];
    _secondImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"signal_strength_excellent.png"]];
    _thirdImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"signal_strength_excellent.png"]];
    
    [self initImageView:_firstImageView superView:_firstButton tag:0];
    [self initImageView:_secondImageView superView:_secondButton tag:1];
    [self initImageView:_thirdImageView superView:_thirdButton tag:2];
    
    [_tab_bar_view addSubview:_firstImageView];
    [_tab_bar_view addSubview:_secondImageView];
    [_tab_bar_view addSubview:_thirdImageView];
    
    //label
    [self initTextView:_firstButton title:@"All" tag:0];
    [self initTextView:_secondButton title:@"Wired" tag:1];
    [self initTextView:_thirdButton title:@"Wireless" tag:2];
    
    
    //triangle indicator
    [self initTriangleView];
    
}

-(void)initTriangleView{
    _cv = [self addTriangleView:_firstButton tag:0];
    _cv2 = [self addTriangleView:_secondButton tag:1];
    _cv3 = [self addTriangleView:_thirdButton tag:2];
    
    [_cv2 setHidden:YES];
    [_cv3 setHidden:YES];
    
}

-(void)initTabButton:(UIButton*)button buttonTag:(int) i {

    button.frame = CGRectMake(0+i * _tab_bar_view.bounds.size.width/3, _tab_bar_view.bounds.origin.y, _tab_bar_view.bounds.size.width/3, _tab_bar_view.bounds.size.height);
    button.tag = i;
    
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)initImageView:(UIImageView *)imageView superView:(UIView *) superView tag:(int)i{
    CGFloat imageViewWidth = superView.frame.size.width*0.6;
    imageView.frame = CGRectMake( (superView.frame.size.width/2-imageViewWidth/2) + i * superView.frame.size.width, superView.frame.size.height*0.15, imageViewWidth, superView.frame.size.height*0.4);
    imageView.tag = i;
    
}

-(void)initTextView:(UIView *) superView title:(NSString *)title tag:(int)i{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0 + i * superView.frame.size.width, superView.frame.size.height*0.6, superView.frame.size.width, superView.frame.size.height*0.2)];
    
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:15];
    label.tag = i;
    
    [self.view addSubview:label];
}

-(void)selectedTab:(UIButton *)button{
    self.selectedIndex = button.tag;
    
    if (_firstButton == button) {
        [_cv setHidden:NO];
        [_cv2 setHidden:YES];
        [_cv3 setHidden:YES];
    }else if(_secondButton == button){
        [_cv2 setHidden:NO];
        [_cv setHidden:YES];
        [_cv3 setHidden:YES];
    }else if(_thirdButton == button){
        [_cv3 setHidden:NO];
        [_cv setHidden:YES];
        [_cv2 setHidden:YES];
    }
    
}

-(CustomView *)addTriangleView:(UIView *)superView tag:(int)tag{
    NSLog(@"super view x:%f,y:%f,width:%f,height:%f",superView.frame.origin.x,superView.frame.origin.y,superView.frame.size.width,superView.frame.size.height);
    
    CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(superView.frame.size.width/2-10 + superView.tag*superView.frame.size.width, superView.frame.size.height-20, 20, 20)];
    
    customView.tag = tag;
    customView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:customView];
    
    return customView;
}

-(void)setSelectedButton:(UIView *)view{
    [_cv setHidden:YES];
    [_cv2 setHidden:YES];
    [_cv3 setHidden:YES];
    
    self.selectedIndex = view.tag;
    [view setHidden:NO];
}

@end
