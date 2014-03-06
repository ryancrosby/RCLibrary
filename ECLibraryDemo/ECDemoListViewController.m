//
//  ECDemoListViewController.m
//  ECLibrary
//
//  Created by Ryan Crosby on 3/5/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import "ECDemoListViewController.h"

#import "ECDemoSectionFlowCollectionViewController.h"

#import "ECDemoMasterDetailController.h"

static NSString *ECSectionFlowLayoutTitle = @"Section Flow Layout";
static NSString *ECMasterDetailControllerTitle = @"Master Detail Controller";

static NSString *ECDemoListViewControllerCellIdentifier = @"ECDemoListViewControllerCellResueIdentifier";

@interface ECDemoListViewController ()

@property (nonatomic, strong) NSArray *tableItems;

@end

@implementation ECDemoListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableItems = @[@[ECSectionFlowLayoutTitle], @[ECMasterDetailControllerTitle]];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ECDemoListViewControllerCellIdentifier];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_tableItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_tableItems[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ECDemoListViewControllerCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = _tableItems[indexPath.section][indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *demoSelected = _tableItems[indexPath.section][indexPath.row];
    
    if ([demoSelected isEqualToString:ECSectionFlowLayoutTitle]) {
        ECDemoSectionFlowCollectionViewController *viewController = [[ECDemoSectionFlowCollectionViewController alloc] initWithCollectionViewLayout:[[ECSectionFlowLayout alloc] init]];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else if ([demoSelected isEqualToString:ECMasterDetailControllerTitle]) {
        ECDemoMasterDetailController *viewController = [[ECDemoMasterDetailController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
