//
//  UIViewController+RCHelpers.m
//  RCLibrary
//
//  Created by Ryan Crosby on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import "UIViewController+RCHelpers.h"

@implementation UIViewController (RCHelpers)

+ (CGRect)rcAvailableScreenSize { return [[UIScreen mainScreen] applicationFrame]; }

+ (void)getMasterViewFrame:(CGRect *)masterViewFrame
        andDetailViewFrame:(CGRect *)detailViewFrame
            splitAtPercent:(CGFloat)splitPoint
         fromContainerView:(CGRect)containerView {

    NSAssert(splitPoint <= 1.0f, @"Split point must be between 0 and 1");
    
    // If the split point is 1.0, set the maseter to the container,
    // and the detail to nothing.
    if (splitPoint == 1.0f) {
        masterViewFrame->origin.x = 0.0f;
        masterViewFrame->origin.y = 0.0f;
        masterViewFrame->size.height = CGRectGetHeight(containerView);
        masterViewFrame->size.width = CGRectGetWidth(containerView);
        
        // Instead of assuming the detail is not set intially
        // we will explicity set it to null just to be safe
        CGRect nullRect = CGRectNull;
        detailViewFrame->origin.x = nullRect.origin.x;
        detailViewFrame->origin.y = nullRect.origin.y;
        detailViewFrame->size.height = nullRect.size.height;
        detailViewFrame->size.width =  nullRect.size.width;
        
        detailViewFrame->origin.x = CGRectGetMaxX(*masterViewFrame);
        detailViewFrame->origin.y = CGRectGetMinY(*masterViewFrame);
        detailViewFrame->size.height = CGRectGetHeight(*masterViewFrame);
        detailViewFrame->size.width =  CGRectGetWidth(*masterViewFrame);

        
        // We are done
        return;
    }
    
    // divide the view at the split point
    CGRectDivide(containerView, masterViewFrame, detailViewFrame, CGRectGetWidth(containerView) * splitPoint, CGRectMinXEdge);

    return;
}

+ (UIInterfaceOrientation)rcCurrentInterfaceOrientation {
    return [UIApplication sharedApplication].statusBarOrientation;
}

+ (CGRect)rcOrientedFrameForFrame:(CGRect)frame {
    CGRect orientedFrame;
    if ( UIInterfaceOrientationIsPortrait([UIViewController rcCurrentInterfaceOrientation]) )
        orientedFrame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(frame), CGRectGetHeight(frame));
    else
        orientedFrame = CGRectMake(0.0f, 0.0f, CGRectGetHeight(frame), CGRectGetWidth(frame));
        
    return orientedFrame;
}


@end
