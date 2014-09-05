//
//  Ball.h
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/1/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    SIDE_RIGHT,
    SIDE_LEFT,
    SIDE_BOTTOM,
    SIDE_TOP,
    SIDE_FRONT,
    SIDE_BACK
}Side;

@protocol BallDelegate
- (void) ballDidBounceOnSide: (Side) side;
@end

@interface Ball : NSObject

@property(weak, nonatomic) id<BallDelegate> delegate;
@property(nonatomic) double x;
@property(nonatomic) double y;
@property(nonatomic) double z;
@property(nonatomic) double dx;
@property(nonatomic) double dy;
@property(nonatomic) double dz;
@property(nonatomic) double rightBound;
@property(nonatomic) double leftBound;
@property(nonatomic) double topBound;
@property(nonatomic) double bottomBound;
@property(nonatomic) double frontBound;
@property(nonatomic) double backBound;
@property(nonatomic) double gravity;
@property(nonatomic) double dampening;

@property(strong, nonatomic) NSArray* blocks;

- (void) updateWithAccelerationX: (double)accelX Y: (double)accelY Z: (double) accelZ;

@end
