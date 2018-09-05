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

+ (instancetype)imageFromText:(NSString *)text
                     fontName:(NSString *)fontName
                    fontFlags:(NSUInteger)fontFlags
                   lineHeight:(NSInteger)lineHeight
                        width:(NSInteger)width
                      spacing:(NSInteger)spacing
                        align:(NSUInteger)align
{
    NSParameterAssert(text);
    NSParameterAssert(fontName);
    
    Gosu::Bitmap bitmap = Gosu::layout_markup(text.UTF8String, fontName.UTF8String, (unsigned)lineHeight, (unsigned)spacing, (unsigned)width, (Gosu::Alignment)align, (unsigned)fontFlags);
    
    GSKImage *image = [self new];
    image->_image.reset(new Gosu::Image(bitmap));
    return image;
}

+ (instancetype)imageFromMacroWithWidth:(NSInteger)width
                                 height:(NSInteger)height
                                 record:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Image macro(Gosu::Graphics::record((int)width, (int)height, block));
    
    GSKImage *image = [self new];
    image->_image.reset(new Gosu::Image(macro));
    return image;
}

+ (NSArray *)imagesFromTiles:(NSString *)filename
                   tileWidth:(NSInteger)tileWidth
                  tileHeight:(NSInteger)tileHeight
                    tileable:(BOOL)tileable
{
    NSParameterAssert(filename);
    
    std::vector<Gosu::Image> tiles = Gosu::load_tiles(filename.UTF8String, (int)tileWidth, (int)tileHeight);
    
    NSMutableArray *mutableTiles = [NSMutableArray new];
    for (Gosu::Image &tile : tiles) {
        GSKImage *image = [self new];
        image->_image.reset(new Gosu::Image(tile));
        [mutableTiles addObject:image];
    }
    return [mutableTiles copy];
}

- (id)initWithFilename:(NSString *)filename
              tileable:(BOOL)tileable
{
    NSParameterAssert(filename);
    
    if (self = [super init]) {
        _image.reset(new Gosu::Image(filename.UTF8String, tileable ? Gosu::IF_TILEABLE : 0));
    }
    return self;
}

#pragma mark - Drawing an image

- (void)drawAtX:(CGFloat)x
              y:(CGFloat)y
              z:(CGFloat)z
         scaleX:(CGFloat)scaleX
         scaleY:(CGFloat)scaleY
          color:(id)color
           mode:(NSUInteger)alphaMode
{
    _image->draw(x, y, z, scaleX, scaleY, [color unsignedIntValue], (Gosu::AlphaMode)alphaMode);
}

- (void)drawAsQuadWithX:(CGFloat)x1 y:(CGFloat)y1 color:(id)c1
                      x:(CGFloat)x2 y:(CGFloat)y2 color:(id)c2
                      x:(CGFloat)x3 y:(CGFloat)y3 color:(id)c3
                      x:(CGFloat)x4 y:(CGFloat)y4 color:(id)c4
                      z:(CGFloat)z
                   mode:(NSUInteger)alphaMode
{
    _image->data().draw(x1, y1, [c1 unsignedIntValue],
                        x2, y2, [c2 unsignedIntValue],
                        x3, y3, [c3 unsignedIntValue],
                        x4, y4, [c4 unsignedIntValue],
                        z, (Gosu::AlphaMode)alphaMode);
}

- (void)drawRotatedAtX:(CGFloat)x
                     y:(CGFloat)y
                     z:(CGFloat)z
                 angle:(CGFloat)angle
               centerX:(CGFloat)centerX
               centerY:(CGFloat)centerY
                scaleX:(CGFloat)scaleX
                scaleY:(CGFloat)scaleY
                 color:(id)color
                  mode:(NSUInteger)alphaMode
{
    _image->draw_rot(x, y, z, angle, centerX, centerY, scaleX, scaleY, [color unsignedIntValue], (Gosu::AlphaMode)alphaMode);
}

#pragma mark - Instance methods

- (void)insert:(GSKImage *)source
             x:(NSInteger)x
             y:(NSInteger)y
{
    _image->data().insert(source->_image->data().to_bitmap(), (int)x, (int)y);
}

- (void)save:(NSString *)filename
{
    Gosu::save_image_file(_image->data().to_bitmap(), filename.UTF8String);
}

- (NSData *)imageData
{
    Gosu::Bitmap bitmap = _image->data().to_bitmap();
    std::size_t bytes = bitmap.width() * bitmap.height() * sizeof(Gosu::Color);
    return [NSData dataWithBytes:bitmap.data() length:bytes];
}

#pragma mark - Internal helpers

- (Gosu::Image &)underlyingGosuImage
{
    return *_image;
}

@end
