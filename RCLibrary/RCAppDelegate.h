//
//  RCAppDelegate.h
//  RCLibrary
//
//  Created by Kim and Ryan on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCViewController;

@interface RCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RCViewController *viewController;

@end
