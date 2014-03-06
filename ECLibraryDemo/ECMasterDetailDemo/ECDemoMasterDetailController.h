//
//  ECViewController.h
//  ECExample
//
//  Created by Kim and Ryan on 1/25/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import "ECMasterDetailViewController.h"

@class ECTableViewSource;

@interface ECDemoMasterDetailController : ECMasterDetailViewController < UITableViewDelegate >

@property ECTableViewSource                     *tableViewSource;

@property (nonatomic, retain) IBOutlet UIView   *landscapeDetailView;

@end