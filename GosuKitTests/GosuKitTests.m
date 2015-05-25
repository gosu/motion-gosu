//
//  GosuKitTests.m
//  GosuKitTests
//
//  Created by Julian Raschke on 25.05.15.
//  Copyright (c) 2015 Gosu Contributors. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import <GosuKit/GosuKit.h>


@interface GosuKitTests : XCTestCase

@end


@implementation GosuKitTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testColorConstructors
{
    GSKColor *color1 = [GSKColor new];
    XCTAssert([color1 gl] == 0x00000000,
              @"default constructor should nil everything out because this is Objective C");
    
    GSKColor *color2 = [[GSKColor alloc] initWithARGB:0x12345678];
    XCTAssert(color2.alpha == 0x12,
              @"getter should return respective byte from constructor");
    XCTAssert(color2.red == 0x34,
              @"getter should return respective byte from constructor");
    XCTAssert(color2.green == 0x56,
              @"getter should return respective byte from constructor");
    XCTAssert(color2.blue == 0x78,
              @"getter should return respective byte from constructor");
    
    GSKColor *color3 = [[GSKColor alloc] initWithAlpha:10 red:20 green:30 blue:40];
    XCTAssert(color3.alpha == 10,
              @"getter should return respective byte from constructor");
    XCTAssert(color3.red == 20,
              @"getter should return respective byte from constructor");
    XCTAssert(color3.green == 30,
              @"getter should return respective byte from constructor");
    XCTAssert(color3.blue == 40,
              @"getter should return respective byte from constructor");
    
    GSKColor *color4 = [[GSKColor alloc] initWithAlpha:123 hue:180.0 saturation:1.0 value:1.0];
    XCTAssert(color4.alpha == 123,
              @"getter should return respective byte from constructor");
    XCTAssert(color4.red == 0,
              @"getter should return respective byte from constructor");
    XCTAssert(color4.green == 0xff,
              @"getter should return respective byte from constructor");
    XCTAssert(color4.blue == 0xff,
              @"getter should return respective byte from constructor");
}

- (void)testColorMutability
{
    GSKColor *color = [[GSKColor alloc] initWithARGB:0x11223344];
    color = [color copy];
    
    XCTAssert(color.green == 0x33,
              @"-[GSKColor copy] should return same color");
    
    XCTAssert([color isMemberOfClass:[GSKColor class]],
              @"-[GSKColor copy] should return immutable color");
    XCTAssertThrows([(GSKMutableColor *)color setAlpha:4]);
    XCTAssertFalse([color respondsToSelector:@selector(setHue:)]);
    
    GSKMutableColor *mutableColor = [color mutableCopy];
    XCTAssert([mutableColor isMemberOfClass:[GSKMutableColor class]],
              @"-[GSKColor mutableCopy] should return mutable color");
    mutableColor.alpha = 0x55;
    XCTAssert(mutableColor.alpha == 0x55,
              @"GSKMutableColor's setters should work");
    
    color = [mutableColor copy];
    XCTAssert([color isMemberOfClass:[GSKColor class]],
              @"-[GSKMutableColor copy] should return immutable color");
    XCTAssert(color.alpha == 0x55,
              @"-[GSKMutableColor copy] should return same color");
}

- (void)testFont
{
    GSKFont *font = [[GSKFont alloc] initWithHeight:23 fontName:GSKDefaultFontName() flags:0];
    XCTAssertEqual(font.name, GSKDefaultFontName(),
                   @"-[GSKFont name] should return constructor parameter");
    XCTAssertEqual(font.height, 23,
                   @"-[GSKFont height] should return constructor parameter");
    XCTAssertEqual([font textWidth:@"Test" scaleX:0], 0,
                   @"the width of every text should be 0 with scaleX=0");
    XCTAssertGreaterThan([font textWidth:@"W" scaleX:1],
                         [font textWidth:@"I" scaleX:1],
                         @"W should be wider than I");
    
    // TODO: Test setImage:forCharacter:
}

@end
