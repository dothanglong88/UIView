//
//  EarthAroundSun.m
//  UIView
//
//  Created by Xmob - Longdt on 5/18/16.
//  Copyright © 2016 Xmob - Longdt. All rights reserved.
//

#import "EarthAroundSun.h"

@interface EarthAroundSun ()

@end

@implementation EarthAroundSun
{
    NSTimer *timer;
    NSTimer *timerMoon;
    UIImageView *moon;
    UIImageView *sun;
    UIImageView *earth;
    CGPoint sunCenter;
    CGPoint earthCenter;
    CGFloat distanceEarthToSun; //cgfloat -> kieu double, chuyen dung tinh toan toa do ....
    CGFloat distanceEarthToMoon;
    CGFloat angle;
    CGFloat angleMoon;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self addSunEarthMoon];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167 //60 frame per second (fps)
                                             target:self
                                           selector:@selector(spinEarth)
                                           userInfo:nil
                                            repeats:true];
    timerMoon = [NSTimer scheduledTimerWithTimeInterval:0.0167 //60 frame per second (fps)
                                             target:self
                                           selector:@selector(spinMoon)
                                           userInfo:nil
                                            repeats:true];

}

-(void) addSunEarthMoon{
    distanceEarthToMoon = 60.0;
    sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun.ico"]];
    CGRect frame = sun.frame;
    frame.size.width = 80;
    frame.size.height = 80;
    sun.frame = frame;
    
    earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth.png"]];
    frame = earth.frame;
    frame.size.width = 40;
    frame.size.height = 40;
    earth.frame = frame;
    
    moon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moon.png"]];
    frame = moon.frame;
    frame.size.width = 20;
    frame.size.height = 20;
    moon.frame = frame;
    
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    sunCenter = CGPointMake(mainViewSize.width*0.5, (mainViewSize.height + statusNavigationBarHeight) *0.5);
    distanceEarthToSun = mainViewSize.width*0.5 - 20.0 - 10.0 - distanceEarthToMoon;
    sun.center = sunCenter;
    
    angle = 0.0;
    angleMoon = 0.0;
    earth.center = [self computePositionOfEarth];
    earthCenter = earth.center;
    
    moon.center = [self computePositionOfMoon];
    
    [self.view addSubview:sun];
    [self.view addSubview:earth];
    [self.view addSubview:moon];
}

-(CGPoint) computePositionOfEarth{
    return CGPointMake(sunCenter.x + distanceEarthToSun *cos(angle), sunCenter.y + distanceEarthToSun * sin(angle));
}

-(CGPoint) computePositionOfMoon{
    return CGPointMake(earthCenter.x + distanceEarthToMoon*cos(angleMoon), earthCenter.y + distanceEarthToMoon * sin(angleMoon));
}

-(void) spinEarth{
    angle += 0.01;
    earth.center = [self computePositionOfEarth];
    earthCenter = earth.center;
}

-(void) spinMoon{
    angleMoon += 0.05;
    moon.center = [self computePositionOfMoon];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    [timerMoon invalidate];
    timer = nil;
    timerMoon = nil;
}

@end
