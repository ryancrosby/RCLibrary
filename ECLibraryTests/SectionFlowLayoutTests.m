//
//  SectionFlowLayoutTests.m
//  ECLibrary
//
//  Created by Ryan Crosby on 3/5/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ECSectionFlowLayout.h"

@interface SectionFlowLayoutTests : XCTestCase

@property (nonatomic, strong) ECSectionFlowLayout *sectionFlowLayout;

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

- (void)testInitialization { XCTAssert(_sectionFlowLayout, @"Object should be alloced"); }

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
