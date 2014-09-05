//
//  GameViewController.h
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/1/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ball.h"

@interface GameViewController : UIViewController<UIAccelerometerDelegate, BallDelegate>

- (id)initWithGameFrame: (CGRect) frame;
- (void) start;
- (void) pause;
- (void) reset;

@end
