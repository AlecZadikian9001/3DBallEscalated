//
//  BallView.h
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/1/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ball.h"

@interface BallView : UIImageView

@property(nonatomic) double maxSize;
@property(nonatomic) double minSize;

- (void) updateWithX: (double) x Y: (double) y Z_ratio: (double) z;
- (void) bounceOnSide: (Side) side;

@end
