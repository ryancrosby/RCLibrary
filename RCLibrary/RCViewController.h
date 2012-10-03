//
//  RCViewController.h
//  RCLibrary
//
//  Created by Ryan Crosby on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import "RCMasterDetailViewController.h"

@class RCTableViewSource;

@interface RCViewController : RCMasterDetailViewController < UITableViewDelegate >

@property RCTableViewSource                     *tableViewSource;

@property (nonatomic, retain) IBOutlet UIView   *landscapeDetailView;

@end
