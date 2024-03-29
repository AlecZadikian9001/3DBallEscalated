//
//  Block.h
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/3/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Block : NSObject

@property(nonatomic) CGRect rect;
@property(nonatomic) double height;

- (bool) intersectsPointWithX: (double) x Y: (double) y Z: (double) z;

@end
