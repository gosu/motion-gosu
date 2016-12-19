#import "GSKImage.h"
#import <Gosu/Gosu.hpp>
#import <memory>


@implementation GSKImage
{
    std::unique_ptr<Gosu::Image> _image;
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

+ (instancetype)imageFromText:(NSString *)text fontName:(NSString *)fontName lineHeight:(NSInteger)lineHeight
{
    NSParameterAssert(text);
    NSParameterAssert(fontName);
    
    Gosu::Bitmap bitmap = Gosu::createText(Gosu::utf8ToWstring([text UTF8String]), Gosu::utf8ToWstring([fontName UTF8String]), (unsigned)lineHeight);
    
    GSKImage *image = [self new];
    image->_image.reset(new Gosu::Image(bitmap));
    return image;
}

+ (instancetype)imageFromText:(NSString *)text fontName:(NSString *)fontName lineHeight:(NSInteger)lineHeight width:(NSInteger)width spacing:(NSInteger)spacing align:(NSUInteger)align
{
    NSParameterAssert(text);
    NSParameterAssert(fontName);
    
    Gosu::Bitmap bitmap = Gosu::createText(Gosu::utf8ToWstring([text UTF8String]), Gosu::utf8ToWstring([fontName UTF8String]), (unsigned)lineHeight, (unsigned)spacing, (unsigned)width, (Gosu::TextAlign)align, 0);
    
    GSKImage *image = [self new];
    image->_image.reset(new Gosu::Image(bitmap));
    return image;
}

+ (instancetype)imageFromMacroWithWidth:(NSInteger)width height:(NSInteger)height record:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::beginRecording();
    block();
    Gosu::Image macro(Gosu::Graphics::endRecording((int)width, (int)height));
    
    GSKImage *image = [self new];
    image->_image.reset(new Gosu::Image(macro));
    return image;
}

+ (NSArray *)imagesFromTiles:(NSString *)filename tileWidth:(NSInteger)tileWidth tileHeight:(NSInteger)tileHeight tileable:(BOOL)tileable
{
    NSParameterAssert(filename);
    
    std::vector<Gosu::Image> tiles = Gosu::loadTiles(Gosu::utf8ToWstring([filename UTF8String]), (int)tileWidth, (int)tileHeight);
    
    NSMutableArray *mutableTiles = [NSMutableArray new];
    for (Gosu::Image &tile : tiles) {
        GSKImage *image = [self new];
        image->_image.reset(new Gosu::Image(tile));
        [mutableTiles addObject:image];
    }
    return [mutableTiles copy];
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

- (void)drawAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z
        scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY
        color:(id)color mode:(NSUInteger)alphaMode
{
    _image->draw(x, y, z, scaleX, scaleY, (unsigned)[color unsignedIntegerValue], (Gosu::AlphaMode)alphaMode);
}

- (void)drawAsQuadWithX:(CGFloat)x1 y:(CGFloat)y1 color:(id)c1
                      x:(CGFloat)x2 y:(CGFloat)y2 color:(id)c2
                      x:(CGFloat)x3 y:(CGFloat)y3 color:(id)c3
                      x:(CGFloat)x4 y:(CGFloat)y4 color:(id)c4
                      z:(CGFloat)z mode:(NSUInteger)alphaMode
{
    _image->getData().draw(x1, y1, (unsigned)[c1 unsignedIntegerValue],
                           x2, y2, (unsigned)[c2 unsignedIntegerValue],
                           x3, y3, (unsigned)[c3 unsignedIntegerValue],
                           x4, y4, (unsigned)[c4 unsignedIntegerValue],
                           z, (Gosu::AlphaMode)alphaMode);
}

- (void)drawRotatedAtX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z
        angle:(CGFloat)angle centerX:(CGFloat)centerX centerY:(CGFloat)centerY
        scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY
        color:(id)color mode:(NSUInteger)alphaMode
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
