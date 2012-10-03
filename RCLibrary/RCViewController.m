//
//  RCViewController.m
//  RCLibrary
//
//  Created by Ryan Crosby on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import "RCViewController.h"

#import "RCTableViewSource.h"
#import "RCDetailView.h"

@interface RCViewController ()

@end

@implementation RCViewController

@synthesize tableViewSource = _tableViewSource;
@synthesize landscapeDetailView = _landscapeDetailView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableViewSource = [[RCTableViewSource alloc] init];
    
    UITableView *newTableView = [[UITableView alloc] initWithFrame:self.masterView.frame style:UITableViewStylePlain];
    newTableView.dataSource = _tableViewSource;
    newTableView.delegate = self;
    
    self.masterView = newTableView;
    
    RCDetailView *newDetailView = [[RCDetailView alloc] initWithFrame:self.detailView.frame];
    newDetailView.scrollEnabled = YES;
    self.detailView = newDetailView;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RCDetailView *newDetailView = [[RCDetailView alloc] initWithFrame:self.detailView.frame];
    newDetailView.scrollEnabled = YES;
    self.detailView = newDetailView;
    
    [self focusOnDetailView];
}

@end
