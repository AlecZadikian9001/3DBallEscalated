//
//  Block.m
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/3/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import "Block.h"

@implementation Block

- (bool) intersectsPointWithX: (double) x Y: (double) y Z: (double) z{
    bool ret = (z <= self.height) && (z > self.height - 10) && (self.rect.origin.x <= x) && (self.rect.origin.x + self.rect.size.width >= x) && (self.rect.origin.y <= y) && (self.rect.origin.y + self.rect.size.height >= y);
    if (ret) NSLog(@"Block hit.");
    return ret;
}

@end
