//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"CampFire", CLASS: @"CampFire"},
                                    @{TITLE: @"Nested Square", CLASS: @"NestedSquare"},
                                    @{TITLE: @"HexColor", CLASS: @"DemoColor"},
                                    @{TITLE: @"Rolling Ball", CLASS: @"RollingBall"}
                          ]};
    NSDictionary* NSTimer = @{SECTION: @"NSTimer", MENU: @[
                                    @{TITLE: @"Earth around Sun", CLASS: @"EarthAroundSun"}
                                    ]};
    
    mainScreen.menu = @[basic, NSTimer];
    mainScreen.title = @"Bootstrap App";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
