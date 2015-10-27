//
//  FWDCircleShape.m
//  WTTF
//
//  Created by Abelardo Marquez on 9/25/15.
//  Copyright © 2015 ajmg. All rights reserved.
//

#import "FWDCircleShape.h"

@implementation FWDCircleShape


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (id)initWithFrame:(CGRect)frame shape:(int)shape{
    
    self = [super initWithFrame:frame];
    
    return self;
    
}


- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    CGFloat total = (self.percentage*2*M_PI)/100;
    
    CGPoint center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    
    CGContextSetLineWidth(ctx, 3);
    CGContextAddArc(ctx, center.x, center.y, (self.frame.size.width/2)-5, -M_PI/2, total-M_PI/2, 0);
    CGContextStrokePath(ctx);
}

@end
