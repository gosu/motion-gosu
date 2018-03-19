#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


@class GSKImage;


@interface GSKFont : NSObject

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/Font.html

// Properties
@property (nonatomic, readonly) NSInteger height;
@property (nonatomic, readonly) NSString *name;

// Drawing text
- (void)drawText:(NSString *)text x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode;
- (void)drawText:(NSString *)text x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z relativeX:(CGFloat)relativeX relativeY:(CGFloat)relativeY scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode;

// Instance methods
- (id)initWithHeight:(NSInteger)height fontName:(NSString *)name flags:(NSUInteger)flags;
- (CGFloat)textWidth:(NSString *)text scaleX:(CGFloat)scaleX;

@end
