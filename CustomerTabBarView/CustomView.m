//
//  CustomView.m
//  CustomerTabBarView
//
//  Created by pccw on 3/5/2017.
//  Copyright © 2017 pccw. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw a triangle
    CGContextBeginPath(context);
    CGContextMoveToPoint   (context, self.bounds.size.width/2, self.bounds.size.height-10);  // top
    CGContextAddLineToPoint(context, 0, self.bounds.size.height);  // right
    CGContextAddLineToPoint(context, self.bounds.size.width,self.bounds.size.height);  // left
    CGContextClosePath(context);
    
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillPath(context);
    
    [self printData];
}

-(void)printData{
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = self.bounds;
    CGFloat view_x = self.bounds.origin.x;
    CGFloat view_y = self.bounds.origin.y;
    CGFloat view_width = self.bounds.size.width;
    CGFloat view_height = self.bounds.size.height;
    NSLog(@"view x:%f,y:%f,width:%f,height:%f",view_x,view_y,view_width,view_height);
}

@end
