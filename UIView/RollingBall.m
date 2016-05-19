//
//  RollingBall.m
//  UIView
//
//  Created by Xmob - Longdt on 5/18/16.
//  Copyright © 2016 Xmob - Longdt. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end

@implementation RollingBall
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat angle; // quay qua bong
    CGFloat ballRadius;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rollBall) userInfo:nil repeats:true];
}

- (void) addBall{
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Football_Ball.png"]];
    //change width and height of frame
    CGRect frame = ball.frame;
    frame.size.width = 64;
    frame.size.height = 64;
    ball.frame = frame;
    //
    ballRadius = 32.0;
    ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5);
    [self.view addSubview:ball];
    
}

- (void) rollBall{
    CGFloat deltaAngle = 0.1;
    angle += deltaAngle;
    ball.transform = CGAffineTransformMakeRotation(angle);
    ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle, ball.center.y);
    
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end
