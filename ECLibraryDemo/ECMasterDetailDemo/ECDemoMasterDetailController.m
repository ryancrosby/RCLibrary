//
//  ECViewController.m
//  ECExample
//
//  Created by Kim and Ryan on 1/25/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import "ECDemoMasterDetailController.h"

#import "ECTableViewSource.h"
#import "ECDetailView.h"

@interface ECDemoMasterDetailController ()

@end

@implementation ECDemoMasterDetailController

@synthesize tableViewSource = _tableViewSource;
@synthesize landscapeDetailView = _landscapeDetailView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableViewSource = [[ECTableViewSource alloc] init];
    
    UITableView *newTableView = [[UITableView alloc] initWithFrame:self.masterView.frame style:UITableViewStylePlain];
    newTableView.dataSource = _tableViewSource;
    newTableView.delegate = self;
    
    self.masterView = newTableView;
    
    ECDetailView *newDetailView = [[ECDetailView alloc] initWithFrame:self.detailView.frame];
    newDetailView.scrollEnabled = YES;
    self.detailView = newDetailView;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ECDetailView *newDetailView = [[ECDetailView alloc] initWithFrame:self.detailView.frame];
    newDetailView.scrollEnabled = YES;
    self.detailView = newDetailView;
    
    [self focusOnDetailView];
}

@end
