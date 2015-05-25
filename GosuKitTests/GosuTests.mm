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

- (void)testColor
{
    Gosu::Color color(0x12345678);
    XCTAssert(color.alpha() == 0x12,
              @"getter should return respective byte from constructor");
    XCTAssert(color.red() == 0x34,
              @"getter should return respective byte from constructor");
    XCTAssert(color.green() == 0x56,
              @"getter should return respective byte from constructor");
    XCTAssert(color.blue() == 0x78,
              @"getter should return respective byte from constructor");
}

@end
