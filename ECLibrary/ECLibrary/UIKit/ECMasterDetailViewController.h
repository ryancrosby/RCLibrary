//
//  ECMasterDetailViewController.h
//  ECLibrary
//
//  Created by Ryan Crosby on 1/25/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ECMasterDetailViewController : UIViewController {
    CGFloat                     _portraitSplitAmount;
    CGFloat                     _landscapeSplitAmount;
}

@property (nonatomic, strong) UIView                    *masterView;
@property (nonatomic, strong) UIView                    *detailView;

- (void)focusOnMasterView;
- (void)focusOnDetailView;

@end
