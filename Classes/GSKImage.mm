#import "GSKImage.h"
#import <Gosu/Gosu.hpp>


@implementation GSKImage
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
    NSParameterAssert(text);
    NSParameterAssert(font);
    
    Gosu::Bitmap bitmap = Gosu::createText(Gosu::utf8ToWstring([text UTF8String]), Gosu::utf8ToWstring([font UTF8String]), (unsigned)lineHeight);
    
    GSKImage *image = [self new];
    image->_image.reset(new Gosu::Image(bitmap));
    return image;
}

+ (instancetype)imageFromText:(NSString *)text font:(NSString *)font lineHeight:(NSInteger)lineHeight width:(NSInteger)width spacing:(NSInteger)spacing align:(NSUInteger)align
{
    NSParameterAssert(text);
    NSParameterAssert(font);
    
    Gosu::Bitmap bitmap = Gosu::createText(Gosu::utf8ToWstring([text UTF8String]), Gosu::utf8ToWstring([font UTF8String]), (unsigned)lineHeight, (unsigned)spacing, (unsigned)width, (Gosu::TextAlign)align, 0);
    
    GSKImage *image = [self new];
    image->_image.reset(new Gosu::Image(bitmap));
    return image;
}

+ (NSArray *)imagesFromTiles:(NSString *)filename tileWidth:(NSInteger)tileWidth tileHeight:(NSInteger)tileHeight tileable:(BOOL)tileable
{
    // TODO
    return nil;
}

- (id)initWithFilename:(NSString *)filename tileable:(BOOL)tileable
{
    NSParameterAssert(filename);
    
    if ((self = [super init])) {
        _image.reset(new Gosu::Image(Gosu::utf8ToWstring([filename UTF8String]), tileable ? Gosu::ifTileable : 0));
    }
    return self;
}

#pragma mark - Drawing an image

- (void)drawAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode
{
    _image->draw(x, y, z, scaleX, scaleY, (unsigned)[color unsignedIntegerValue], (Gosu::AlphaMode)alphaMode);
}

// TODO -drawAsQuad...

- (void)drawRotatedAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z angle:(CGFloat)angle centerX:(CGFloat)centerX centerY:(CGFloat)centerY scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode
{
    _image->drawRot(x, y, z, angle, centerX, centerY, scaleX, scaleY, (unsigned)[color unsignedIntegerValue], (Gosu::AlphaMode)alphaMode);
}

#pragma mark - Instance methods

- (void)insert:(GSKImage *)source x:(NSInteger)x y:(NSInteger)y
{
    _image->getData().insert(source->_image->getData().toBitmap(), (int)x, (int)y);
}

- (void)save:(NSString *)filename
{
    Gosu::saveImageFile(_image->getData().toBitmap(), Gosu::utf8ToWstring([filename UTF8String]));
}

- (NSData *)imageData
{
    Gosu::Bitmap bitmap = _image->getData().toBitmap();
    std::size_t bytes = bitmap.width() * bitmap.height() * sizeof(Gosu::Color);
    return [NSData dataWithBytes:bitmap.data() length:bytes];
}

#pragma mark - Internal helpers

- (Gosu::Image &)underlyingGosuImage
{
    return *_image;
}

@end
