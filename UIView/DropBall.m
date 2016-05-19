//
//  DropBall.m
//  UIView
//
//  Created by Xmob - Longdt on 5/19/16.
//  Copyright © 2016 Xmob - Longdt. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()

@end

@implementation DropBall
{
    NSTimer *timer;
    UIImageView *ball;
    CGFloat ballRadius;
    CGFloat x, y, vellocityY, accellerateY, maxHeight;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone; //toa do bat dau o ngay sau status bar
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil repeats:true];
}

- (void) addBall{
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football.png"]];
    CGSize mainViewSize = self.view.bounds.size;
    ballRadius = 32.0;
    x = mainViewSize.width * 0.5;
    y = ballRadius;
    
    vellocityY = 0.0;
    accellerateY = 4.0;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    maxHeight = mainViewSize.height - statusNavigationBarHeight - ballRadius;
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
    
}

- (void) dropBall{
    vellocityY += accellerateY;
    y += vellocityY;
    if (y> maxHeight){
        vellocityY =- vellocityY * 0.9; //damper
        y = maxHeight;
    }
    ball.center = CGPointMake(x,y);
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end
