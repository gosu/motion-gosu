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
- (void)drawAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode;
// TODO -drawAsQuad...
- (void)drawRotatedAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z angle:(CGFloat)angle centerX:(CGFloat)centerX centerY:(CGFloat)centerY scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode;

// Instance methods
- (void)insert:(GSKImage *)source x:(NSInteger)x y:(NSInteger)y;
- (void)save:(NSString *)filename;
- (NSData *)imageData; // == toBlob

// TODO - glTexInfo

@end
