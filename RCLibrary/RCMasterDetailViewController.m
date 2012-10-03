//
//  RCMasterDetailViewController.m
//  RCLibrary
//
//  Created by Ryan Crosby on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import "RCMasterDetailViewController.h"

#import "UIViewController+RCHelpers.h"

@interface RCMasterDetailViewController ()
- (void)addMasterGestureRecognizers;
@end

@implementation RCMasterDetailViewController

@synthesize masterView = _masterView;
@synthesize detailView = _detailView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        NSAssert(nibNameOrNil == nil, @"This view controller does not support nib files currently.");
        
        _portraitSplitAmount = 1.0f;
        _landscapeSplitAmount = 0.25f;
        
    }
    return self;
}

- (void)loadView {
    // Custom initialization
    CGRect viewFrame = [UIViewController rcAvailableScreenSize];
    
    UIView *containerView = [[UIView alloc] initWithFrame:viewFrame];
    [containerView setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)];
    
    CGRect masterFrame = CGRectNull;
    CGRect detailFrame = CGRectNull;
    
    if ( UIInterfaceOrientationIsPortrait([UIViewController rcCurrentInterfaceOrientation]))
        [UIViewController getMasterViewFrame:&masterFrame andDetailViewFrame:&detailFrame splitAtPercent:_portraitSplitAmount fromContainerView:viewFrame];
    else
        [UIViewController getMasterViewFrame:&masterFrame andDetailViewFrame:&detailFrame splitAtPercent:_landscapeSplitAmount fromContainerView:viewFrame];
    
    _masterView = [[UIView alloc] initWithFrame:masterFrame];
    [_masterView setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleRightMargin)];
    
    _masterView.backgroundColor = [UIColor redColor];

    _detailView = [[UIView alloc] initWithFrame:detailFrame];
    [_detailView setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin)];
    _detailView.backgroundColor = [UIColor blueColor];
    
    [containerView addSubview:_masterView];
    [containerView addSubview:_detailView];
    
    self.view = containerView;
    

}

- (void)addMasterGestureRecognizers {
    // Add the gesture recognizer
    UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleMasterLeftSwipeGesture:)];
    [leftSwipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [_masterView addGestureRecognizer:leftSwipeGestureRecognizer];
    
    UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleMasterLeftSwipeGesture:)];
    [rightSwipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [_masterView addGestureRecognizer:rightSwipeGestureRecognizer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration {
    
    // Get the oriented frame, so that we have the correct width and height for the new view
    CGRect viewFrame = [UIViewController rcOrientedFrameForFrame:self.view.frame];
    
    CGRect masterFrame = CGRectNull;
    CGRect detailFrame = CGRectNull;
    
    if ( UIInterfaceOrientationIsPortrait([UIViewController rcCurrentInterfaceOrientation]))
        [UIViewController getMasterViewFrame:&masterFrame andDetailViewFrame:&detailFrame splitAtPercent:_portraitSplitAmount fromContainerView:viewFrame];
    else
        [UIViewController getMasterViewFrame:&masterFrame andDetailViewFrame:&detailFrame splitAtPercent:_landscapeSplitAmount fromContainerView:viewFrame];
    
    if (duration > 0) {
        [UIView animateWithDuration:duration animations:^{
            _masterView.frame = masterFrame;
            _detailView.frame = detailFrame;
        }];
    }
    else {
        _masterView.frame = masterFrame;
        _detailView.frame = detailFrame;
    }

}

- (void)setMasterView:(UIView *)newMasterView {
    newMasterView.frame = _masterView.frame;
    
    // Remove the old masterview
    [_masterView removeFromSuperview];
    
    // Set the new masterview
    _masterView = newMasterView;
    [self.view addSubview:_masterView];
    
    [self addMasterGestureRecognizers];
}

- (void)setDetailView:(UIView *)newDetailView {
    newDetailView.frame = _detailView.frame;
    
    // Remove the old detailview
    [_detailView removeFromSuperview];
    
    // Set the new detailview
    _detailView = newDetailView;
    [self.view addSubview:_detailView];
}

- (void)focusOnDetailView {
    // Get the oriented frame, so that we have the correct width and height for the new view
    CGRect viewFrame = [UIViewController rcOrientedFrameForFrame:self.view.frame];
    
    CGRect masterFrame = CGRectNull;
    CGRect detailFrame = CGRectNull;
    
    if ( UIInterfaceOrientationIsPortrait([UIViewController rcCurrentInterfaceOrientation]))
        [UIViewController getMasterViewFrame:&masterFrame andDetailViewFrame:&detailFrame splitAtPercent:0.10f fromContainerView:viewFrame];
    else
        [UIViewController getMasterViewFrame:&masterFrame andDetailViewFrame:&detailFrame splitAtPercent:_landscapeSplitAmount fromContainerView:viewFrame];
    
    [UIView animateWithDuration:0.5 animations:^{
        _masterView.frame = masterFrame;
        _detailView.frame = detailFrame;
    }];

}

- (void)focusOnMasterView {
    // Get the oriented frame, so that we have the correct width and height for the new view
    CGRect viewFrame = [UIViewController rcOrientedFrameForFrame:self.view.frame];
    
    CGRect masterFrame = CGRectNull;
    CGRect detailFrame = CGRectNull;
    
    if ( UIInterfaceOrientationIsPortrait([UIViewController rcCurrentInterfaceOrientation]))
        [UIViewController getMasterViewFrame:&masterFrame andDetailViewFrame:&detailFrame splitAtPercent:_portraitSplitAmount fromContainerView:viewFrame];
    else
        [UIViewController getMasterViewFrame:&masterFrame andDetailViewFrame:&detailFrame splitAtPercent:_landscapeSplitAmount fromContainerView:viewFrame];
    
    [UIView animateWithDuration:0.5 animations:^{
        _masterView.frame = masterFrame;
        _detailView.frame = detailFrame;
    }];
}

- (void)handleMasterLeftSwipeGesture:(UISwipeGestureRecognizer *)sender {
    [self focusOnMasterView];
}

- (void)handleMasterRightSwipeGesture:(UISwipeGestureRecognizer *)sender {
    [self focusOnDetailView];
}

@end
