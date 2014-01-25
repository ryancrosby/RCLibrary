//
//  UIViewController+ECHelpers.h
//  ECLibrary
//
//  Created by Ryan Crosby on 1/25/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ECHelpers)

/*
 * Returns the currently available screen size
 * accounting for orientation and status bar
 *
 */
+ (CGRect)ecAvailableScreenSize;

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
+ (void)ecGetMasterViewFrame:(CGRect *)masterViewFrame
          andDetailViewFrame:(CGRect *)detailViewFrame
              splitAtPercent:(CGFloat)splitPoint
           fromContainerView:(CGRect)containerView;

/*
 * Returns the current interface orientation
 *
 */
+ (UIInterfaceOrientation)ecCurrentInterfaceOrientation;

/*
 * Returns the oriented frame for the current interface
 * orientation based on the given orientation
 */
+ (CGRect)ecOrientedFrameForFrame:(CGRect)frame;

@end
