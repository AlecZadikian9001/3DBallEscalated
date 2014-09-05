//
//  Ball.m
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/1/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import "Ball.h"
#import "Block.h"

@implementation Ball

@synthesize dx, dy, dz, x, y, z, gravity, rightBound, leftBound, topBound, bottomBound, frontBound, backBound, dampening;

- (void) updateWithAccelerationX: (double)accelX Y: (double)accelY Z: (double) accelZ{
    //NSLog(@"BallView updating with acceleration %f, %f, %f.", x, y, z);
    dx+=accelX*gravity;
    dy-=accelY*gravity;
    dz+=accelZ*gravity;
    
    if (x>=rightBound){
        x = rightBound - 1;
        dx = -dx*.7;
        [_delegate ballDidBounceOnSide:SIDE_RIGHT];
    }
    else if (x<=leftBound){
        x = leftBound + 1;
        dx = -dx*dampening;
        [_delegate ballDidBounceOnSide:SIDE_LEFT];
    }
    if (y>=bottomBound){
        y = bottomBound - 1;
        dy = -dy*dampening;
        [_delegate ballDidBounceOnSide:SIDE_BOTTOM];
    }
    else if (y<=topBound){
        y = topBound + 1;
        dy = -dy*dampening;
        [_delegate ballDidBounceOnSide:SIDE_TOP];
    }
    if (z>=frontBound){
        z = frontBound-1;
        dz = -dz*dampening;
        [_delegate ballDidBounceOnSide:SIDE_FRONT];
    }
    else if (z<=backBound){
        z = backBound+1;
        dz = -dz*dampening;
        [_delegate ballDidBounceOnSide:SIDE_BACK];
    }
    
    for (Block* block in _blocks){
        if ([block intersectsPointWithX:x Y:y Z:z]){
            z = block.height+1;
            dz = -dz*dampening;
            [_delegate ballDidBounceOnSide:SIDE_BACK];
        }
    }
    
    x+=dx;
    y+=dy;
    z+=dz;
    //NSLog(@"Ball coordinates: %f, %f, %f", x, y, z);
}

@end
