//
//  ECLibraryTestSuite.m
//  ECLibraryTestSuite
//
//  Created by Ryan Crosby on 3/12/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ECLibraryTestSuite : XCTestCase

@end

@implementation ECLibraryTestSuite

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
