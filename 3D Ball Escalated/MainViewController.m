//
//  MainViewController.m
//  3D Ball Escalated
//
//  Created by Alec Zadikian on 9/1/14.
//  Copyright (c) 2014 AlecZ. All rights reserved.
//

#import "MainViewController.h"
#import <iAd/iAd.h>
#import "iAd/ADBannerView.h"
#import "GameViewController.h"

#define frameX (self.view.frame.origin.x)
#define frameY (self.view.frame.origin.y)
#define frameW (self.view.frame.size.width)
#define frameH (self.view.frame.size.height)

#define adX (frameX)

@interface MainViewController ()
@property(strong, nonatomic) ADBannerView* ad;
@property(strong, nonatomic) GameViewController* game;
@property(nonatomic) bool bannerIsVisible;
@end

@implementation MainViewController

- (id)init{
    self = [super init];
    if (self) {
        NSLog(@"MainViewController initializing.");
        _ad = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        _ad.delegate = self;
        _ad.frame = CGRectMake(adX, frameY + frameH, _ad.frame.size.width, _ad.frame.size.height);
        _game = [[GameViewController alloc] initWithGameFrame:CGRectMake(frameX, frameY, frameW, frameH - _ad.frame.size.height)];
        [self.view addSubview:_ad];
        [self.view addSubview:_game.view];
        [_game start]; // TODO test
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"MainViewController viewDidLoad");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"BannerViewDidLoadAd");
    if (!_bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (_bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

@end
