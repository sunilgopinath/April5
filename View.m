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
        self.backgroundColor = [UIColor yellowColor];

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"self.frame == (%g, %g), %g × %g",
          self.frame.origin.x,
          self.frame.origin.y,
          self.frame.size.width,
          self.frame.size.height
          );
    
	NSLog(@"self.bounds == (%g, %g), %g × %g",
          self.bounds.origin.x,
          self.bounds.origin.y,
          self.bounds.size.width,
          self.bounds.size.height
          );
    
    UIFont *font = [UIFont systemFontOfSize:16.0];
    NSString *string = NSLocalizedString(@"Greeting", @"displayed with drawAtPoint:");
    CGPoint point = CGPointMake(0.0, 0.0);
    [string drawAtPoint:point withFont:font];
    
	//Fill and stroke a right triangle.
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat length = min * 5 / 8;           //of side
    
	CGMutablePathRef p = CGPathCreateMutable();   //right triangle
	CGPathMoveToPoint(p, NULL, 0, 0);          //lower right vertex (the right angle)
	CGPathAddLineToPoint(p, NULL, 0, length);  //upper right vertex
	CGPathAddLineToPoint(p, NULL, -length, 0); //lower left vertex
	CGPathCloseSubpath(p);
    
	CGContextRef c = UIGraphicsGetCurrentContext();
    CGRect bounds = self.bounds;
    CGFloat radius = .3 * bounds.size.width;	//in pixels
    
    
	//Origin at right angle.
	CGContextTranslateCTM(c,
                          (size.width + length) / 2,
                          (size.height + length) / 2
                          );
	CGContextScaleCTM(c, 1, -1);
    
    CGContextSetLineWidth(c, 2.0);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    CGColorRef color = CGColorCreate(colorspace, components);
    
    // line going down from back wheel
    CGContextMoveToPoint(c, 5, 45);
    CGContextAddLineToPoint(c, -65, 35);
    CGContextAddLineToPoint(c, -55, 125);
    // line going up from back wheel
    CGContextMoveToPoint(c, 5, 45);
    CGContextAddLineToPoint(c, -55, 125);
    
    // bar across top
    CGContextMoveToPoint(c, -55, 125);
    CGContextAddLineToPoint(c, -125, 125);
    
    // bar going diagonally left from pedal
    CGContextMoveToPoint(c, -65, 35);
    CGContextAddLineToPoint(c, -125, 105);
    
    // line from front wheel
    CGContextMoveToPoint(c, -155, 45);
    CGContextAddLineToPoint(c, -125, 105);
    // creating handle bar vertical bar
    CGContextAddLineToPoint(c, -125, 145);
    // handle bar
    CGContextAddLineToPoint(c, -105, 145);
    
    // seat stem
    CGContextMoveToPoint(c, -55, 125);
    CGContextAddLineToPoint(c, -55, 135);
    
    // seat level
    CGContextMoveToPoint(c, -65, 135);
    CGContextAddLineToPoint(c, -45, 135);
    
    // top pedal stem
    CGContextMoveToPoint(c, -65, 35);
    CGContextAddLineToPoint(c, -65, 55);
    
    // top pedal
    CGContextMoveToPoint(c, -70, 55);
    CGContextAddLineToPoint(c, -60, 55);
    
    // bottom pedal stem
    CGContextMoveToPoint(c, -65, 35);
    CGContextAddLineToPoint(c, -65, 15);
    
    // top pedal
    CGContextMoveToPoint(c, -70, 15);
    CGContextAddLineToPoint(c, -60, 15);
    
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
    CGContextSetShadow(c, CGSizeMake(10, -20), 5);
    CGContextStrokePath(c);
    
    CGRect r = CGRectMake(
                          -45,
                          bounds.origin.y,
                          radius,
                          radius
                          );
    
    CGRect r1 = CGRectMake(
                          -200,
                          bounds.origin.y,
                          radius,
                          radius
                          );
    
    
	CGContextBeginPath(c);
	//CGContextAddPath(c, p);
    CGContextAddEllipseInRect(c, r);
    CGContextAddEllipseInRect(c, r1);
    
	CGContextSetLineWidth(c, 10.0);
	CGContextSetRGBStrokeColor(c, 0.0, 0.0, 1.0, 1);
    CGContextSetShadow(c, CGSizeMake(10, -20), 5);	
    CGContextStrokePath(c);
	CGPathRelease(p);
    
}


@end
