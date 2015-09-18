#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


@interface GSKImage : NSObject

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/Image.html

// Properties
@property (nonatomic, readonly) NSInteger height;
@property (nonatomic, readonly) NSInteger width;

// Creating and loading images
+ (instancetype)imageFromText:(NSString *)text fontName:(NSString *)fontName lineHeight:(NSInteger)lineHeight;
+ (instancetype)imageFromText:(NSString *)text fontName:(NSString *)fontName lineHeight:(NSInteger)lineHeight width:(NSInteger)width spacing:(NSInteger)spacing align:(NSUInteger)align;
+ (instancetype)imageFromMacroWithWidth:(NSInteger)width height:(NSInteger)height record:(void (^)())block;
+ (NSArray *)imagesFromTiles:(NSString *)filename tileWidth:(NSInteger)tileWidth tileHeight:(NSInteger)tileHeight tileable:(BOOL)tileable;
- (id)initWithFilename:(NSString *)filename tileable:(BOOL)tileable;

// Drawing an image
- (void)drawAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z
        scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY
        color:(id)color mode:(NSUInteger)alphaMode;
- (void)drawAsQuadWithX:(CGFloat)x1 y:(CGFloat)y1 color:(id)c1
                      x:(CGFloat)x2 y:(CGFloat)y2 color:(id)c2
                      x:(CGFloat)x3 y:(CGFloat)y3 color:(id)c3
                      x:(CGFloat)x4 y:(CGFloat)y4 color:(id)c4
                      z:(CGFloat)z mode:(NSUInteger)alphaMode;
- (void)drawRotatedAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z
        angle:(CGFloat)angle centerX:(CGFloat)centerX centerY:(CGFloat)centerY
        scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY
        color:(id)color mode:(NSUInteger)alphaMode;

// Instance methods
- (void)insert:(GSKImage *)source x:(NSInteger)x y:(NSInteger)y;
- (void)save:(NSString *)filename;
- (NSData *)imageData; // == toBlob

// TODO - glTexInfo

@end
