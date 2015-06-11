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
#import <unistd.h>


static NSString *kBMPTempFilename = @"/tmp/GosuKitTests-Test.bmp";


@interface GosuKitTests : XCTestCase

@end


@implementation GosuKitTests

- (void)setUp
{
    [super setUp];
    
    NSString *resourcePath = [[NSBundle bundleForClass:self.class] resourcePath];
    chdir([resourcePath UTF8String]);
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testColorConstructors
{
    GSKColor *color1 = [GSKColor new];
    XCTAssertEqual([color1 gl], 0x00000000,
              @"default constructor should nil everything out because this is Objective C");
    
    GSKColor *color2 = [[GSKColor alloc] initWithARGB:0x12345678];
    XCTAssertEqual(color2.alpha, 0x12);
    XCTAssertEqual(color2.red, 0x34);
    XCTAssertEqual(color2.green, 0x56);
    XCTAssertEqual(color2.blue, 0x78);
    
    GSKColor *color3 = [[GSKColor alloc] initWithAlpha:10 red:20 green:30 blue:40];
    XCTAssertEqual(color3.alpha, 10);
    XCTAssertEqual(color3.red, 20);
    XCTAssertEqual(color3.green, 30);
    XCTAssertEqual(color3.blue, 40);
    
    GSKColor *color4 = [[GSKColor alloc] initWithAlpha:123 hue:180.0 saturation:1.0 value:1.0];
    XCTAssertEqual(color4.alpha, 123);
    XCTAssertEqual(color4.red, 0);
    XCTAssertEqual(color4.green, 0xff);
    XCTAssertEqual(color4.blue, 0xff);
}

- (void)testColorMutability
{
    GSKColor *color = [[GSKColor alloc] initWithARGB:0x11223344];
    color = [color copy];
    
    XCTAssertEqual(color.green, 0x33);
    XCTAssert([color isMemberOfClass:[GSKColor class]],
              @"-[GSKColor copy] should return immutable color");
    XCTAssertThrows([(GSKMutableColor *)color setAlpha:4]);
    XCTAssertFalse([color respondsToSelector:@selector(setHue:)]);
    
    GSKMutableColor *mutableColor = [color mutableCopy];
    XCTAssert([mutableColor isMemberOfClass:[GSKMutableColor class]]);
    mutableColor.alpha = 0x55;
    XCTAssertEqual(mutableColor.alpha, 0x55);
    
    color = [mutableColor copy];
    XCTAssert([color isMemberOfClass:[GSKColor class]],
              @"-[GSKMutableColor copy] should return immutable color");
    XCTAssertEqual(color.alpha, 0x55);
}

- (void)testFont
{
    GSKFont *font = [[GSKFont alloc] initWithHeight:23 fontName:GSKGetDefaultFontName() flags:0];
    XCTAssertEqualObjects(font.name, GSKGetDefaultFontName());
    XCTAssertEqual(font.height, 23);
    XCTAssertEqual([font textWidth:@"Test" scaleX:0], 0,
                   @"the width of every text should be 0 with scaleX=0");
    XCTAssertGreaterThan([font textWidth:@"W" scaleX:1],
                         [font textWidth:@"I" scaleX:1],
                         @"W should be wider than I");
    
    // TODO: Find a way to test draw:...
    
    GSKImage *image = [[GSKImage alloc] initWithFilename:@"test.png" tileable:NO];
    [font setImage:image forCharacter:'X'];
    XCTAssertEqual([font textWidth:@"X" scaleX:1], 123);
}

- (void)testGlobalFunctions
{
    XCTAssertGreaterThan(GSKGetAvailableWidth(), GSKGetAvailableHeight());
    XCTAssertGreaterThan(GSKGetScreenWidth(), GSKGetScreenHeight());
    
    float const kAccuracy = 0.1;
    XCTAssertEqualWithAccuracy(GSKGetAngle(10, 0, 40, 30), 135, kAccuracy);
    XCTAssertEqualWithAccuracy(GSKGetAngleDifference(0, 36000), 0, kAccuracy);
    XCTAssertEqualWithAccuracy(GSKGetAngleDifference(0, 45), 45, kAccuracy);
    XCTAssertEqualWithAccuracy(GSKGetAngleDifference(350, 10), 20, kAccuracy);
    
    XCTAssertEqualWithAccuracy(GSKGetOffsetX(0, 12345), 0, kAccuracy);
    XCTAssertEqualWithAccuracy(GSKGetOffsetY(0, 12345), -12345, kAccuracy);
    
    NSInteger idOfC = GSKGetButtonIDFromCharacter('c');
    XCTAssertNotEqual(idOfC, 0);
    XCTAssertEqual(GSKGetCharacterFromButtonID(idOfC), 'c');
    
    XCTAssertGreaterThanOrEqual([GSKGetLanguage() length], 2);
    
    NSInteger ms = GSKGetMilliseconds();
    sleep(1);
    XCTAssertEqualWithAccuracy(GSKGetMilliseconds() - ms, 1000, 50);
}

- (void)testGraphics
{
    XCTAssertThrows([GSKGraphics flush],
                    @"cannot flush outside of rendering/recording");
    XCTAssertThrows([GSKGraphics performGL:^{}],
                    @"cannot run OpenGL outside of rendering");
    CGFloat transform[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5 };
    XCTAssertThrows([GSKGraphics transform:&transform perform:^{}],
                    @"cannot transform outside of rendering/recording");
    
    GSKImage *image = [GSKGraphics recordWithWidth:100 height:50 perform:^{
        [GSKGraphics drawLineFromX:0 y:0 color:@0xff112233
                               toX:100 y:50 color:@0xff332211
                                 z:0 mode:0];
    }];
    XCTAssertEqual(image.width, 100);
    XCTAssertEqual(image.height, 50);
}

- (void)testImageFile
{
    GSKImage *image = [[GSKImage alloc] initWithFilename:@"test.png" tileable:NO];
    XCTAssertEqual(image.width, 123);
    XCTAssertEqual(image.height, 123);
    
    NSData *data = [image imageData];
    unsigned char *pixels = (unsigned char *)[data bytes];
    // Alpha value of first row should be == 0.
    for (NSInteger i = 0; i < image.width; i += 20) {
        XCTAssertEqual(pixels[i * 4 + 3], 0x00);
    }
    
    [image insert:image x:-10 y:-10];
    [image insert:image x:10 y:-10];
    NSData *modifiedData = [image imageData];
    unsigned char *modifiedPixels = (unsigned char *)[modifiedData bytes];
    // Alpha value of first row should be != 0 now that we have inserted the image into itself.
    for (NSInteger i = 0; i < image.width; i += 20) {
        XCTAssertNotEqual(modifiedPixels[i * 4 + 3], 0x00);
    }
    
    [image save:kBMPTempFilename];
    GSKImage *imageReloadedAsBMP = [[GSKImage alloc] initWithFilename:kBMPTempFilename tileable:YES];
    NSData *BMPData = [imageReloadedAsBMP imageData];
    unsigned char *BMPPixels = (unsigned char *)[BMPData bytes];
    // First pixel should still be overwritten by insert-ed image
    XCTAssertEqual(BMPPixels[3], 0xff);
    // Last pixel should still be translucent
    XCTAssertEqual(BMPPixels[BMPData.length - 1], 0x00);
}

- (void)testImageFromText
{
    GSKImage *image = [GSKImage imageFromText:@"Hallo\nWelt" fontName:GSKGetDefaultFontName() lineHeight:17];
    XCTAssertEqual(image.height, 2 * 17);
    
    GSKImage *multilineImage = [GSKImage imageFromText:@"A a a a a a a a a a a a a a a" fontName:GSKGetDefaultFontName() lineHeight:23 width:40 spacing:13 align:0];
    XCTAssertEqual(multilineImage.width, 40);
    XCTAssertGreaterThan(multilineImage.height, 23);
    XCTAssertEqual((multilineImage.height + 13) % (23 + 13), 0);
}

- (void)testImageFromTiles
{
    NSArray *images = [GSKImage imagesFromTiles:@"test.png" tileWidth:61 tileHeight:-3 tileable:NO];
    XCTAssertEqual([images count], 6);
    
    GSKImage *oneImage = images[1];
    XCTAssertEqual(oneImage.width, 61);
    GSKImage *anotherImage = images[2];
    XCTAssertEqual(anotherImage.height, 123 / 3);
}

- (void)testSample
{
    GSKSample *sample = [[GSKSample alloc] initWithFilename:@"beep.wav"];
    XCTAssert(sample,
              @"should be able to load sample from relative filename");
    
    GSKSampleInstance *instance = [sample playWithVolume:0.1 speed:3 loop:NO];
    
    XCTAssert([instance isPlaying],
              @"SampleInstance should be 'playing' after creation");
    XCTAssertFalse([instance isPaused],
                   @"SampleInstance should not be 'paused' after creation");
    
    [instance pause];
    XCTAssertFalse(instance.playing);
    XCTAssert(instance.paused);
    [instance resume];
    XCTAssert(instance.playing);
    XCTAssertFalse(instance.paused);
    
    sleep(1);
    
    XCTAssertFalse([instance isPlaying],
                   @"SampleInstance should not be 'playing' anymore after one second");
    XCTAssertFalse([instance isPaused],
                   @"SampleInstance should not be 'paused' after playing");
    
    instance = [sample playWithPan:0 volume:0.1 speed:0.1 loop:YES];
    
    sleep(1);
    
    XCTAssert([instance isPlaying],
              @"SampleInstance should still be 'playing' because of looping");
    [instance stop];
    XCTAssertFalse([instance isPlaying],
                   @"SampleInstance should stop playing immediately after stopping it");
}

- (void)testSong
{
    XCTAssertEqual([GSKSong currentSong], nil);
    
    GSKSong *song1 = [[GSKSong alloc] initWithFilename:@"jingle_bells.mp3"];
    XCTAssertFalse(song1.playing);
    
    GSKSong *song2 = [[GSKSong alloc] initWithFilename:@"jingle_bells.ogg"];
    XCTAssertFalse(song2.paused);
    
    [song1 play:NO];
    XCTAssert(song1.playing);
    XCTAssertEqual([GSKSong currentSong], song1);
    
    [song2 play:YES];
    XCTAssertFalse(song1.playing);
    XCTAssert(song2.playing);
    XCTAssertEqual([GSKSong currentSong], song2);
    
    [song2 stop];
    XCTAssertFalse(song1.playing);
    XCTAssertFalse(song2.playing);
    XCTAssertEqual([GSKSong currentSong], nil);
}

- (void)testWindow
{
    GSKWindow *window = [[GSKWindow alloc] initWithWidth:34567 height:23456 fullscreen:NO];
    XCTAssertEqual(window.width, 34567);
    XCTAssertEqual(window.height, 23456);
    XCTAssertEqual(window.fullscreen, NO);
    window.caption = @"Jüst Testÿng 🎈 哈哈";
    XCTAssertEqualObjects(window.caption, @"Jüst Testÿng 🎈 哈哈");
}

@end
