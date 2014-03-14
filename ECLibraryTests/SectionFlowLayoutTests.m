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

@end

@implementation ECCollectionViewLayoutMockData

@end

@interface SectionFlowLayoutTests : XCTestCase {
    CGRect _collectionViewFrame;
    
    NSInteger _sectionCount;
    NSInteger _sectionItemCount;
}

@property (nonatomic, strong) ECSectionFlowLayout *sectionFlowLayout;
    
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) id mockDataSource;

@end

@implementation SectionFlowLayoutTests

- (void)setUp
{
    [super setUp];
    
    _sectionCount = 15;
    _sectionItemCount = 2;
    
    self.mockDataSource = [OCMockObject mockForProtocol:@protocol(UICollectionViewDataSource)];
    
    [[[_mockDataSource stub] andReturnValue:@(_sectionCount)] numberOfSectionsInCollectionView:[OCMArg any]];
    [[[[_mockDataSource stub] andReturnValue:@(_sectionItemCount)] ignoringNonObjectArgs] collectionView:[OCMArg any] numberOfItemsInSection:0];
    
    _collectionViewFrame = CGRectMake(25.f, 25.f, 100.f, 100.f);
    
    self.sectionFlowLayout = [[ECSectionFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:_collectionViewFrame collectionViewLayout:_sectionFlowLayout];
    _collectionView.dataSource = _mockDataSource;
    
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
    
    self.collectionView.dataSource = _mockDataSource;
}

- (void)testInitialization { XCTAssert(_sectionFlowLayout, @"Object should be alloced"); }
    
- (void)testContentSize {
    
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[@(2),@(2),@(2),@(2),@(2),@(2),@(2),@(2),@(2),@(2),@(2),@(2),@(2),@(2),@(2),];
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    NSInteger expectedColumns = 4;
    NSInteger expectedRows = 2;
    
    CGFloat contentWidth = CGRectGetWidth(_collectionViewFrame) / expectedColumns * ([mockData.itemCounts count] / expectedRows);
    CGFloat contentHeight = CGRectGetHeight(_collectionViewFrame);
    
    CGSize expectedContentSize = CGSizeMake(contentWidth, contentHeight);
    
    CGSize contentSize = [_sectionFlowLayout collectionViewContentSize];
    
    XCTAssert(CGSizeEqualToSize(contentSize, expectedContentSize), @"Content size expected to be %@, but is %@", NSStringFromCGSize(expectedContentSize), NSStringFromCGSize(contentSize));
}

- (void)testContentSizeFewItems {
    
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[@(2),@(2)];
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    NSInteger expectedColumns = 2;
    NSInteger expectedRows = 1;
    
    CGFloat contentWidth = CGRectGetWidth(_collectionViewFrame) / expectedColumns * ([mockData.itemCounts count] / expectedRows);
    CGFloat contentHeight = CGRectGetHeight(_collectionViewFrame);
    
    CGSize expectedContentSize = CGSizeMake(contentWidth, contentHeight);
    
    CGSize contentSize = [_sectionFlowLayout collectionViewContentSize];
    
    XCTAssert(CGSizeEqualToSize(contentSize, expectedContentSize), @"Content size expected to be %@, but is %@", NSStringFromCGSize(expectedContentSize), NSStringFromCGSize(contentSize));
}

- (void)testContentSizeOneItem {
    
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[@(2)];
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    NSInteger expectedColumns = 1;
    NSInteger expectedRows = 1;
    
    CGFloat contentWidth = CGRectGetWidth(_collectionViewFrame) / expectedColumns * ([mockData.itemCounts count] / expectedRows);
    CGFloat contentHeight = CGRectGetHeight(_collectionViewFrame);
    
    CGSize expectedContentSize = CGSizeMake(contentWidth, contentHeight);
    
    CGSize contentSize = [_sectionFlowLayout collectionViewContentSize];
    
    XCTAssert(CGSizeEqualToSize(contentSize, expectedContentSize), @"Content size expected to be %@, but is %@", NSStringFromCGSize(expectedContentSize), NSStringFromCGSize(contentSize));
}

- (void)testContentSizeNoItems {
    
    ECCollectionViewLayoutMockData *mockData = [[ECCollectionViewLayoutMockData alloc] init];
    mockData.itemCounts = @[];
    
    [self mockCollectionViewLayoutDependencies:mockData];
    
    NSInteger expectedColumns = 0;
    NSInteger expectedRows = 0;
    
    CGFloat contentWidth = 0; // CGRectGetWidth(_collectionViewFrame) / expectedColumns * ([mockData.itemCounts count] / expectedRows);
    CGFloat contentHeight = 0; //CGRectGetHeight(_collectionViewFrame);
    
    CGSize expectedContentSize = CGSizeMake(contentWidth, contentHeight);
    
    CGSize contentSize = [_sectionFlowLayout collectionViewContentSize];
    
    XCTAssert(CGSizeEqualToSize(contentSize, expectedContentSize), @"Content size expected to be %@, but is %@", NSStringFromCGSize(expectedContentSize), NSStringFromCGSize(contentSize));
}

@end
