//
//  GameViewController.m
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/1/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import "GameViewController.h"
#import "GameView.h"
#import "Ball.h"
#import "Block.h"
#import "BlockView.h"
#import "BallView.h"
#import <AudioToolbox/AudioToolbox.h>
#import "StrokeLabel.h"

#define frameX (self.view.frame.origin.x)
#define frameY (self.view.frame.origin.y)
#define frameW (self.view.frame.size.width)
#define frameH (self.view.frame.size.height)

#define ballX 50
#define ballY 50
#define ballW 20
#define ballH 20

@interface GameViewController ()
@property(strong, nonatomic) Ball* ball;
@property(strong, nonatomic) BallView* ballView;
@property(atomic) BOOL isRunning;
@property(nonatomic) SystemSoundID audioPlayer;
@property(nonatomic) int numBounces;
@property(strong, nonatomic) StrokeLabel* counter;
@end

@implementation GameViewController

- (id)initWithGameFrame:(CGRect)frame{
    self = [super init];
    if (self) {
        NSLog(@"GameViewController initializing.");
        self.view = [[GameView alloc] initWithFrame:frame];
        _counter = [[StrokeLabel alloc] initWithFrame:CGRectMake(frameX + 5, frameY + frameH - 30, 100, 30)];
        _counter.textColor = [UIColor redColor];
        _counter.text = @"0";
        _counter.font = [UIFont fontWithName:@"Arial" size:25];
        _ball = [[Ball alloc] init];
        _ball.delegate = self;
        _ballView = [[BallView alloc] initWithFrame:CGRectMake(ballX, ballY, ballW, ballH)];
        _ballView.minSize = 10;
        _ballView.maxSize = frameW/2;
        _ball.x = ballX + ballW/2;
        _ball.y = ballY + ballH/2;
        _ball.z = 10;
        _ball.gravity = 12;
        _ball.dampening = 0.7;
        _ball.leftBound = frameX+20;
        _ball.rightBound = frameX + frameW-20;
        _ball.topBound = frameY-20;
        _ball.bottomBound = frameY + frameH+10;
        _ball.backBound = 0;
        _ball.frontBound = 1200;
        _isRunning = false;
        [self.view addSubview:_ballView];
        [self.view addSubview:_counter];
        [[UIAccelerometer sharedAccelerometer] setUpdateInterval:0.1];
        [[UIAccelerometer sharedAccelerometer] setDelegate:self];
        NSString *soundFilePath = [NSString stringWithFormat:@"%@/hit.aif",
                                   [[NSBundle mainBundle] resourcePath]];
        NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) soundFileURL, &_audioPlayer);
        
        //todo read block sequence
        Block* testBlock = [[Block alloc] init];
        testBlock.rect = CGRectMake(50, 50, 50, 50);
        testBlock.height = 50;
        BlockView* testBlockView = [[BlockView alloc] initWithFrame:testBlock.rect];
        testBlockView.heightRatio = 50/_ball.frontBound;
        testBlockView.minSize = _ballView.minSize;
        testBlockView.maxSize = _ballView.maxSize;
        testBlock.rect = [testBlockView newRectFromRect: CGRectMake(50, 50, 50, 50)];
        [self.view addSubview:testBlockView];
        _ball.blocks = @[testBlock];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    if (!_isRunning) return;
    [_ball updateWithAccelerationX:acceleration.x Y:acceleration.y Z:acceleration.z];
    [_ballView updateWithX:_ball.x Y:_ball.y Z_ratio:_ball.z/(_ball.frontBound-_ball.backBound)];
}

- (void) start{
    NSLog(@"GameViewController starting.");
    _isRunning = true;
}
- (void) pause{
    NSLog(@"GameViewController pausing.");
    _isRunning = false;
}
- (void) reset{
    // TODO
}

- (void) ballDidBounceOnSide:(Side)side{
    [_ballView bounceOnSide:side];
    AudioServicesPlaySystemSound(_audioPlayer);
    _numBounces++;
    _counter.text = [NSString stringWithFormat:@"%d", _numBounces];
}

@end





















