//
//  BlockView.h
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/3/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockView : UIView
@property(nonatomic) double heightRatio;
@property(nonatomic) double maxSize;
@property(nonatomic) double minSize;

- (CGRect) newRectFromRect: (CGRect) rect;
@end
