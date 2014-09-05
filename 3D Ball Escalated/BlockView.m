//
//  BlockView.m
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/3/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import "BlockView.h"

@implementation BlockView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect topRect = [self newRectFromRect: rect];
    CGContextSetRGBStrokeColor(ctx, .8, .8, .8, 1);
    CGContextAddRect(ctx, topRect);
    //todo
}

- (CGRect) newRectFromRect: (CGRect) rect{
    double width = (double) _heightRatio*(_maxSize - _minSize) + _minSize;
    double height = width;
    return CGRectMake(rect.origin.x - width/2, rect.origin.y - height/2, width, height);
}


@end
