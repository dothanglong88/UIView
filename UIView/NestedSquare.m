//
//  NestedSquare.m
//  UIView
//
//  Created by Xmob - Longdt on 5/13/16.
//  Copyright © 2016 Xmob - Longdt. All rights reserved.
//

#import "NestedSquare.h"
#import <AVFoundation/AVFoundation.h>;

@interface NestedSquare ()
{
    AVAudioPlayer * audioPlayer;
}

@end

@implementation NestedSquare

- (void)viewDidLoad {
    [super viewDidLoad];
    [self songPlayer];
    self.view.backgroundColor = [UIColor blackColor];
    [self drawNestedSquares];
    [self performSelector:@selector(rotateAllSquare)
               withObject:nil
               afterDelay:2];
}

- (void) drawNestedSquares{
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 20;
    CGFloat recWidth = mainViewSize.width - margin *2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height +self.navigationController.navigationBar.bounds.size.height;
    CGPoint center = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    for (int i = 0; i < 10; i++) {
        UIView* square;
        if (i % 2 == 0){
                square = [self drawSquareByWidth:recWidth andRotate:false atCenter:center];
        }
        else{
            square = [self drawSquareByWidth:recWidth andRotate:true atCenter:center];
        }
        [self.view addSubview:square];
        recWidth = recWidth * 0.707 ;// 1/can2
    }
}

- (UIView *) drawSquareByWidth: (CGFloat) width
                     andRotate: (BOOL) rotate
                      atCenter:(CGPoint) center{
    UIView * square = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    square.center = center;
    square.backgroundColor = rotate ? [UIColor whiteColor]: [UIColor blackColor];
    square.transform = rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return square;
}

- (void) rotateAllSquare{
    [UIView animateWithDuration:2.0 animations:^{
        for (int i = 0; i < self.view.subviews.count; i++) {
            if (i % 2 == 0){
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformIdentity;
            }else{
                
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(M_PI_4);
            }
        }
    }];
}

-(void) songPlayer{
    NSString *pathUrl = [[NSBundle mainBundle] pathForResource:@"adagio" ofType:@"mp3"];
    NSURL * pathMp3 = [NSURL fileURLWithPath:pathUrl];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:pathMp3 error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}

- (void) viewWillDisappear:(BOOL)animated{
    [audioPlayer stop];
}

@end
