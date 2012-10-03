//
//  RCMasterDetailViewController.h
//  RCLibrary
//
//  Created by Ryan Crosby on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCMasterDetailViewController : UIViewController {
    CGFloat                     _portraitSplitAmount;
    CGFloat                     _landscapeSplitAmount;
}

@property (nonatomic, strong) UIView                    *masterView;
@property (nonatomic, strong) UIView                    *detailView;

- (void)focusOnMasterView;
- (void)focusOnDetailView;

@end
