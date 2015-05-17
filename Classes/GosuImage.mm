#import "GosuImage.h"
#import <Gosu/Gosu.hpp>


@implementation GosuImage
{
    GOSU_UNIQUE_PTR<Gosu::Image> _image;
}

#pragma mark - Properties

- (NSInteger)height
{
    return _image->height();
}

- (NSInteger)width
{
    return _image->width();
}

#pragma mark - Creating and loading images

+ (instancetype)imageFromText:(NSString *)text font:(NSString *)font lineHeight:(NSInteger)lineHeight
{
    // TODO
    return nil;
}

+ (instancetype)imageFromText:(NSString *)text font:(NSString *)font lineHeight:(NSInteger)lineHeight width:(NSInteger)width spacing:(NSInteger)spacing align:(NSUInteger)align
{
    // TODO
    return nil;
}

+ (NSArray *)imagesFromTiles:(NSString *)filename tileWidth:(NSInteger)tileWidth tileHeight:(NSInteger)tileHeight tileable:(BOOL)tileable
{
    // TODO
    return nil;
}

- (id)initWithFilename:(NSString *)filename tileable:(BOOL)tileable
{
    if ((self = [super init])) {
        _image.reset(new Gosu::Image(Gosu::utf8ToWstring([filename UTF8String]), tileable ? Gosu::ifTileable : 0));
    }
    return self;
}

#pragma mark - Drawing an image

- (void)drawAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode
{
    _image->draw(x, y, z, scaleX, scaleY, [color unsignedIntegerValue], (Gosu::AlphaMode)alphaMode);
}

// TODO -drawAsQuad...

- (void)drawRotatedAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z angle:(CGFloat)angle centerX:(CGFloat)centerX centerY:(CGFloat)centerY scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode
{
    _image->drawRot(x, y, z, angle, centerX, centerY, scaleX, scaleY, [color unsignedIntegerValue], (Gosu::AlphaMode)alphaMode);
}

#pragma mark - Instance methods

- (void)insert:(GosuImage *)source x:(NSInteger)x y:(NSInteger)y
{
    _image->getData().insert(source->_image->getData().toBitmap(), x, y);
}

- (void)save:(NSString *)filename
{
    Gosu::saveImageFile(_image->getData().toBitmap(), Gosu::utf8ToWstring([filename UTF8String]));
}

// TODO -toBlob

@end
