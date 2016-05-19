//
//  ColorView.h
//  UIView
//
//  Created by Xmob - Longdt on 5/17/16.
//  Copyright © 2016 Xmob - Longdt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorView : UIControl
- (instancetype) initWithHex: (NSString*) hex
                       alpha: (CGFloat) alpha
                       frame: (CGRect) rect;
@property (nonatomic, strong) NSString *hex;

- (void) fadeOut;
@end
