#import "GSKColor.h"
#import "GSKFont.h"
#import "GSKGraphics.h"
#import "GSKImage.h"
#import "GSKMutableColor.h"
#import "GSKSample.h"
#import "GSKSampleInstance.h"
#import "GSKSong.h"
#import "GSKWindow.h"

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#ifdef __cplusplus
extern "C" {
#endif

// Math

CGFloat GSKAngle(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2);
CGFloat GSKAngleDiff(CGFloat angle1, CGFloat angle2);
CGFloat GSKDistance(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2);
CGFloat GSKOffsetX(CGFloat angle, CGFloat radius);
CGFloat GSKOffsetY(CGFloat angle, CGFloat radius);
CGFloat GSKRandom(CGFloat min, CGFloat max);

// Available screen space
    
NSInteger GSKAvailableHeight();
NSInteger GSKAvailableWidth();
NSInteger GSKScreenHeight();
NSInteger GSKScreenWidth();

// Input
BOOL GSKIsButtonDown(NSInteger buttonID);
unichar GSKButtonIDToChar(NSInteger buttonID);
NSInteger GSKCharToButtonID(unichar c);

// UI
NSString *GSKDefaultFontName();
NSInteger GSKFramesPerSecond();
NSString *GSKLanguage();
NSInteger GSKMilliseconds();
    
#ifdef __cplusplus
} // extern "C"
#endif
