//
//  StrokeLabel.m
//  3D Ball
//
//  Created by Alec Zadikian on 6/19/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import "StrokeLabel.h"

@implementation StrokeLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
    
	CGContextSaveGState(context);
	CGContextSetTextDrawingMode(context, kCGTextFill);
    
	// Draw the text without an outline
	[super drawTextInRect:rect];
    
	CGImageRef alphaMask = NULL;
		// Create a mask from the text (with the gradient)
		alphaMask = CGBitmapContextCreateImage(context);
        
		// Outline width
		CGContextSetLineWidth(context, 4);
		CGContextSetLineJoin(context, kCGLineJoinRound);
        
		// Set the drawing method to stroke
		CGContextSetTextDrawingMode(context, kCGTextStroke);
    UIColor* temp = self.textColor;
		// Outline color
		self.textColor = [UIColor whiteColor];
        
		// notice the +1 for the y-coordinate. this is to account for the face that the outline appears to be thicker on top
		[super drawTextInRect:CGRectMake(rect.origin.x, rect.origin.y+1, rect.size.width, rect.size.height)];
        
		// Draw the saved image over the outline
		// and invert everything because CoreGraphics works with an inverted coordinate system
		CGContextTranslateCTM(context, 0, rect.size.height);
		CGContextScaleCTM(context, 1.0, -1.0);
		CGContextDrawImage(context, rect, alphaMask);
        
		// Clean up because ARC doesnt handle CG
		CGImageRelease(alphaMask);
    self.textColor = temp;
}

@end
