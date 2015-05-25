//
//  GosuTests.m
//  GosuTests
//
//  Created by Julian Raschke on 25.05.15.
//  Copyright (c) 2015 Gosu Contributors. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#include <Gosu/Gosu.hpp>


@interface GosuTests : XCTestCase

@end


@implementation GosuTests

- (void)testExample
{
    
    // This is an example of a functional test case.
    XCTAssert(NSClassFromString(@"GSKImage"), @"Pass");
}

@end
