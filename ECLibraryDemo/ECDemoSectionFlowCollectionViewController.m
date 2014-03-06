//
//  ECDemoSectionFlowCollectionViewController.m
//  ECLibrary
//
//  Created by Ryan Crosby on 3/5/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import "ECDemoSectionFlowCollectionViewController.h"

static NSString *ECDemoSectionFlowCellIdentifier = @"ECDemoSectionFlowCellIdentifier";

@interface ECDemoSectionFlowCollectionViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ECDemoSectionFlowCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ECDemoSectionFlowCellIdentifier];
    
    self.dataSource = @[
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"],
                        @[@"One", @"Two"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [_dataSource count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_dataSource[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ECDemoSectionFlowCellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            [cell setBackgroundColor:[UIColor greenColor]];
            break;
            
        case 1:
        default:
            [cell setBackgroundColor:[UIColor blueColor]];
            break;
    }
    
    return cell;
}

@end
