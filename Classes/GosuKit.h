#import "GSKChannel.h"
#import "GSKColor.h"
#import "GSKFont.h"
#import "GSKGraphics.h"
#import "GSKImage.h"
#import "GSKMutableColor.h"
#import "GSKSample.h"
#import "GSKSong.h"
#import "GSKWindow.h"

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#ifdef __cplusplus
extern "C" {
#endif

// Math
    
CGFloat GSKGetAngle(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2);
CGFloat GSKGetAngleDifference(CGFloat angle1, CGFloat angle2);
CGFloat GSKGetDistance(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2);
CGFloat GSKGetOffsetX(CGFloat angle, CGFloat radius);
CGFloat GSKGetOffsetY(CGFloat angle, CGFloat radius);
CGFloat GSKRandom(CGFloat min, CGFloat max);

// Available screen space

NSInteger GSKGetAvailableHeight();
NSInteger GSKGetAvailableWidth();
NSInteger GSKGetScreenHeight();
NSInteger GSKGetScreenWidth();

// Input
    
BOOL GSKIsButtonDown(NSInteger buttonID);
NSString *GSKGetCharacterFromButtonID(NSInteger buttonID);
NSInteger GSKGetButtonIDFromCharacter(NSString *c);

// UI

NSString *GSKGetDefaultFontName();
NSInteger GSKGetFramesPerSecond();
NSString *GSKGetLanguage();
NSInteger GSKGetMilliseconds();
    
#ifdef __cplusplus
} // extern "C"
#endif
