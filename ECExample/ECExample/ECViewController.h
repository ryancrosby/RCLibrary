//
//  ECViewController.h
//  ECExample
//
//  Created by Kim and Ryan on 1/25/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import <ECLibrary/UIKit/ECMasterDetailViewController.h>

@class ECTableViewSource;

@interface ECViewController : ECMasterDetailViewController < UITableViewDelegate >

@property ECTableViewSource                     *tableViewSource;

@property (nonatomic, retain) IBOutlet UIView   *landscapeDetailView;

@end