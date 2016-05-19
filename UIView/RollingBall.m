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
    CGFloat maxWidth;
    BOOL rollRightToLeft;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rollBall) userInfo:nil repeats:true];
}

- (void) addBall{
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football.png"]];
    ballRadius = 32.0;
    rollRightToLeft = false;
    ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5);
    maxWidth = mainViewSize.width - ballRadius;
    [self.view addSubview:ball];
    
}

- (void) rollBall{
    CGFloat deltaAngle = 0.1;
    angle += deltaAngle;
    if (!rollRightToLeft){
    ball.transform = CGAffineTransformMakeRotation(angle);
    ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle, ball.center.y);
        if (ball.center.x >= maxWidth){
            rollRightToLeft = true;
        }
    }else{
        ball.transform = CGAffineTransformMakeRotation(-angle);
        ball.center = CGPointMake(ball.center.x - ballRadius * deltaAngle, ball.center.y);
        if (ball.center.x <= ballRadius){
            rollRightToLeft = false;
        }
    }
    
    
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end
