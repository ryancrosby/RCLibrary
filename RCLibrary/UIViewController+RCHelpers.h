//
//  UIViewController+RCHelpers.h
//  RCLibrary
//
//  Created by Ryan Crosby on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RCHelpers)

/*
 * Returns the currently available screen size
 * accounting for orientation and status bar
 *
 */
+ (CGRect)rcAvailableScreenSize;

/*
 * Calculates a master view frame and detail view
 * frame split at a splitPoint within a container
 * view frame.
 *
 * @returns masterViewFrame
 * @returns detailViewFrame
 * @input splitPoint ex. 0.25f = 1/4 of the left of the
 *        screen will be split
 * @input containerView the view the calculations are based on
 *
 */
+ (void)getMasterViewFrame:(CGRect *)masterViewFrame
        andDetailViewFrame:(CGRect *)detailViewFrame
            splitAtPercent:(CGFloat)splitPoint
         fromContainerView:(CGRect)containerView;

/*
 * Returns the current interface orientation
 *
 */
+ (UIInterfaceOrientation)rcCurrentInterfaceOrientation;

/*
 * Returns the oriented frame for the current interface
 * orientation based on the given orientation
 */
+ (CGRect)rcOrientedFrameForFrame:(CGRect)frame;

@end
