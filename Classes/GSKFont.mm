#import "GSKFont.h"
#import "GSKImage.h"
#import <Gosu/Gosu.hpp>
#import <memory>


@interface GSKImage (InternalHelpers)

- (Gosu::Image &)underlyingGosuImage;

@end


@implementation GSKFont
{
    std::unique_ptr<Gosu::Font> _font;
}

#pragma mark - Properties

- (NSInteger)height
{
    return _font->height();
}

- (NSString *)name
{
    return [[NSString alloc] initWithUTF8String:_font->name().c_str()];
}

#pragma mark - Drawing text

- (void)drawText:(NSString *)text x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode
{
    NSParameterAssert(text);
    
    _font->draw_markup(text.UTF8String, x, y, z, scaleX, scaleY, [color unsignedIntValue], (Gosu::AlphaMode)alphaMode);
}

- (void)drawText:(NSString *)text x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z relativeX:(CGFloat)relativeX relativeY:(CGFloat)relativeY scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode
{
    NSParameterAssert(text);
    
    _font->draw_markup_rel(text.UTF8String, x, y, z, relativeX, relativeY, scaleX, scaleY, [color unsignedIntValue], (Gosu::AlphaMode)alphaMode);
}

#pragma mark - Instance methods

- (id)initWithHeight:(NSInteger)height fontName:(NSString *)name flags:(NSUInteger)flags
{
    NSParameterAssert(name);
    
    if (self = [super init]) {
        _font.reset(new Gosu::Font((unsigned)height, name.UTF8String, (unsigned)flags));
    }
    return self;
}

- (CGFloat)textWidth:(NSString *)text scaleX:(CGFloat)scaleX
{
    NSParameterAssert(text);
    
    return _font->text_width(text.UTF8String) * scaleX;
}

@end
