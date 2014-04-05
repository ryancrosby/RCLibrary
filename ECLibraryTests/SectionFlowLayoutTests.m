//
//  SectionFlowLayoutTests.m
//  ECLibrary
//
//  Created by Ryan Crosby on 3/5/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <OCMock/OCMock.h>

#import "ECSectionFlowLayout.h"

@interface ECCollectionViewLayoutMockData : NSObject

@property (nonatomic, retain) NSArray *itemCounts;
@property (nonatomic, assign) CGRect collectionViewFrame;

@end

@implementation ECCollectionViewLayoutMockData

@end

@interface SectionFlowLayoutTests : XCTestCase

@property (nonatomic, strong) ECSectionFlowLayout *sectionFlowLayout;
    
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) id mockDataSource;

@end

@implementation SectionFlowLayoutTests

- (void)setUp
{
    [super setUp];
    
    self.sectionFlowLayout = [[ECSectionFlowLayout alloc] init];
}

- (void)tearDown
{
    self.sectionFlowLayout = nil;
    
    [super tearDown];
}

- (void)mockCollectionViewLayoutDependencies:(ECCollectionViewLayoutMockData *)mockData {
    self.mockDataSource = [OCMockObject mockForProtocol:@protocol(UICollectionViewDataSource)];
    
    [[[_mockDataSource stub] andReturnValue:@([mockData.itemCounts count])] numberOfSectionsInCollectionView:[OCMArg any]];
    
    [mockData.itemCounts enumerateObjectsUsingBlock:^(NSNumber *itemCountForSection, NSUInteger idx, BOOL *stop) {
        [[[_mockDataSource stub] andReturnValue:@([itemCountForSection integerValue])] collectionView:[OCMArg any] numberOfItemsInSection:idx];
    }];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:mockData.collectionViewFrame collectionViewLayout:_sectionFlowLayout];
    
    self.collectionView.dataSource = _mockDataSource;
}

- (void)testInitialization { XCTAssert(_sectionFlowLayout, @"Object should be alloced"); }

- (void)testLayoutAttributes {
    
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[@(2),@(2),@(2),@(2)];
    mockData.collectionViewFrame = CGRectMake(0.f, 0.f, 100.f, 100.f);
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    NSIndexPath *indexPathToTest = [NSIndexPath indexPathForItem:0 inSection:1];
    
    UICollectionViewLayoutAttributes *expectedLayoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPathToTest];
    expectedLayoutAttributes.frame = CGRectMake(15.f, 15.f, 30.f, 30.f);
    
    UICollectionViewLayoutAttributes *layoutAttributes = [_sectionFlowLayout layoutAttributesForItemAtIndexPath:indexPathToTest];
    
    XCTAssert(([expectedLayoutAttributes.indexPath compare:layoutAttributes.indexPath] == NSOrderedSame), @"Index Paths do not match");
    XCTAssert(CGRectEqualToRect(expectedLayoutAttributes.frame, layoutAttributes.frame), @"Content size expected to be %@, but is %@", NSStringFromCGRect(expectedLayoutAttributes.frame), NSStringFromCGRect(layoutAttributes.frame));
}

- (void)testLayoutAttributesForRect {
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[@(2),@(2),@(2),@(2)];
    mockData.collectionViewFrame = CGRectMake(0.f, 0.f, 100.f, 100.f);
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    NSIndexPath *indexPathToTest = [NSIndexPath indexPathForItem:0 inSection:1];
    
    UICollectionViewLayoutAttributes *expectedLayoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPathToTest];
    expectedLayoutAttributes.frame = CGRectMake(15.f, 15.f, 30.f, 30.f);
    
    //UICollectionViewLayoutAttributes *layoutAttributes = [_sectionFlowLayout layoutAttributesForItemAtIndexPath:indexPathToTest];
    NSArray *attributes = [_sectionFlowLayout layoutAttributesForElementsInRect:CGRectMake(0.0f, 0.0f, 100.f, 100.f)];
    
    for (UICollectionViewLayoutAttributes *layoutAttributes in attributes) {
        if ([layoutAttributes.indexPath isEqual:[NSIndexPath indexPathForItem:0 inSection:1]]) {
            if (layoutAttributes) {
                <#statements#>
            }
        } else {
            <#statements#>
        }
    }
    
    
    XCTAssert(([expectedLayoutAttributes.indexPath compare:layoutAttributes.indexPath] == NSOrderedSame), @"Index Paths do not match");
    XCTAssert(CGRectEqualToRect(expectedLayoutAttributes.frame, layoutAttributes.frame), @"Content size expected to be %@, but is %@", NSStringFromCGRect(expectedLayoutAttributes.frame), NSStringFromCGRect(layoutAttributes.frame));
}

- (void)testContentSize {
    
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[@(2),@(2),@(2),@(2),@(2),@(2),@(2),@(2)];
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    CGSize expectedContentSize = CGSizeMake(340.f, 100.f);
    
    CGSize contentSize = [_sectionFlowLayout collectionViewContentSize];
    
    XCTAssert(CGSizeEqualToSize(contentSize, expectedContentSize), @"Content size expected to be %@, but is %@", NSStringFromCGSize(expectedContentSize), NSStringFromCGSize(contentSize));
}

- (void)testContentSizeFewItems {
    
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[@(2),@(2)];
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    NSInteger expectedColumns = 2;
    NSInteger expectedRows = 1;
    
    CGSize expectedContentSize = CGSizeMake(100.f, 100.f);
    
    CGSize contentSize = [_sectionFlowLayout collectionViewContentSize];
    
    XCTAssert(CGSizeEqualToSize(contentSize, expectedContentSize), @"Content size expected to be %@, but is %@", NSStringFromCGSize(expectedContentSize), NSStringFromCGSize(contentSize));
}

- (void)testContentSizeOneItem {
    
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[@(2)];
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    CGSize expectedContentSize = CGSizeMake(100.f, 100.f);
    
    CGSize contentSize = [_sectionFlowLayout collectionViewContentSize];
    
    XCTAssert(CGSizeEqualToSize(contentSize, expectedContentSize), @"Content size expected to be %@, but is %@", NSStringFromCGSize(expectedContentSize), NSStringFromCGSize(contentSize));
}

- (void)testContentSizeNoItems {
    
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[];
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    CGSize expectedContentSize = CGSizeMake(100.f, 100.f);
    
    CGSize contentSize = [_sectionFlowLayout collectionViewContentSize];
    
    XCTAssert(CGSizeEqualToSize(contentSize, expectedContentSize), @"Content size expected to be %@, but is %@", NSStringFromCGSize(expectedContentSize), NSStringFromCGSize(contentSize));
}

@end
