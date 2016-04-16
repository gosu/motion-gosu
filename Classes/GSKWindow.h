#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <TargetConditionals.h>


@interface GSKWindow : NSObject

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/Window.html

// Properties
@property (nonatomic, copy) NSString *caption;
@property (nonatomic, readonly, getter=isFullscreen) BOOL fullscreen;
@property (nonatomic, readonly) NSInteger height;
@property (nonatomic) CGFloat mouseX;
@property (nonatomic) CGFloat mouseY;
@property (nonatomic, readonly) NSTimeInterval updateInterval;
@property (nonatomic, readonly) NSInteger width;

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
@property (nonatomic, readonly) UIWindow *UIWindow;
#endif

// Callbacks
- (void)buttonDown:(NSInteger)buttonID;
- (void)buttonUp:(NSInteger)buttonID;
- (void)draw;
- (BOOL)needsCursor;
- (BOOL)needsRedraw;
- (void)update;

// Instance methods
- (id)initWithWidth:(NSInteger)width height:(NSInteger)height fullscreen:(BOOL)fullscreen updateInterval:(NSTimeInterval)updateInterval;
- (void)show;
- (void)close;

@end
