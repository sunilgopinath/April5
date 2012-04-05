//
//  View.m
//  April5
//
//  Created by Sunil Gopinath on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // Drawing code
    CGRect bounds = self.bounds;
    CGFloat radius = .3 * bounds.size.width;	//in pixels
    
    /*
     Create the invisible square that will surround the circle.
     Place the upper left corner of the square at the upper left corner of
     the View.  bounds.origin.x and bounds.origin.y are the coordinates of
     the upper left corner of the View.
     */
    CGRect r = CGRectMake(
                          bounds.origin.x,
                          bounds.origin.y,
                          2 * radius,
                          2 * radius
                          );
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextBeginPath(c); //unnecessary here: the path is already empty.
    CGContextAddEllipseInRect(c, r);
    CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);	//red, opaque
    CGContextFillPath(c);
}


@end