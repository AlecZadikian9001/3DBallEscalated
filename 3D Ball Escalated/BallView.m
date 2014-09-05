//
//  BallView.m
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/1/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import "BallView.h"

#define frameX (self.frame.origin.x)
#define frameY (self.frame.origin.y)
#define frameW (self.frame.size.width)
#define frameH (self.frame.size.height)

@interface BallView()
@property(strong, nonatomic) UIView* flash;
@end

@implementation BallView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"ball1.png"]];
        _flash = [[UIView alloc] initWithFrame:CGRectMake(0,0,10,10)];
        _flash.backgroundColor = [UIColor colorWithRed:1 green:.3 blue:.3 alpha:.7];
        [self addSubview:_flash];
    }
    return self;
}

- (void) updateWithX: (double) x Y: (double) y Z_ratio: (double) z{
    //NSLog(@"BallView updating with ratio %f.", z);
    double ballHeight = (double) z*(_maxSize - _minSize) + _minSize;
    double ballWidth = ballHeight;
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options: UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         self.frame = CGRectMake(x - ballWidth/2, y - ballHeight/2, ballWidth, ballHeight);
                     }
                     completion:^(BOOL finished){
                     }];
    //NSLog(@"BallView coordinates: %f, %f", frameX, frameY);
}

- (void) bounceOnSide: (Side) side{
    _flash.alpha = 0;
    [self sendSubviewToBack:_flash];
    switch(side){
        case SIDE_BACK:{
            _flash.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            break;
        }
        case SIDE_FRONT:{
            _flash.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            [self bringSubviewToFront:_flash];
            break;
        }
        case SIDE_LEFT:{
            _flash.frame = CGRectMake(0, 0, 2, self.frame.size.height);
            break;
        }
        case SIDE_RIGHT:{
            _flash.frame = CGRectMake(0+self.frame.size.width, 0, 2, self.frame.size.height);
            break;
        }
        case SIDE_BOTTOM:{
            _flash.frame = CGRectMake(0-1, 0+self.frame.size.height, self.frame.size.width, 2);
            break;
        }
        case SIDE_TOP:{
            _flash.frame = CGRectMake(0, 0-1, self.frame.size.width, 2);
            break;
        }
    }
    [UIView animateWithDuration:.2 animations:^{
        _flash.alpha = 1;
        _flash.alpha = 0;
    }];
}

@end















