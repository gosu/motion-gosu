#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


@interface GosuWindow : NSObject

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

// Callbacks
- (void)buttonDown:(NSInteger)buttonID;
- (void)buttonUp:(NSInteger)buttonID;
- (void)draw;
- (BOOL)needsCursor;
- (BOOL)needsRedraw;
- (void)update;

// Instance methods
- (id)initWithWidth:(NSInteger)width height:(NSInteger)height fullscreen:(BOOL)fullscreen;
- (void)show;
- (void)close;

@end
