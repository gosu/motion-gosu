#import "GSKFont.h"
#import "GSKImage.h"
#import <Gosu/Gosu.hpp>


@interface GSKImage (InternalHelpers)

- (Gosu::Image &)underlyingGosuImage;

@end


@implementation GSKFont
{
    GOSU_UNIQUE_PTR<Gosu::Font> _font;
}

#pragma mark - Properties

- (NSInteger)height
{
    return _font->height();
}

- (NSString *)name
{
    return [[NSString alloc] initWithUTF8String:Gosu::wstringToUTF8(_font->name()).c_str()];
}

// Drawing text


- (void)drawText:(NSString *)text x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode
{
    NSParameterAssert(text);
    
    _font->draw(Gosu::utf8ToWstring([text UTF8String]), x, y, z, scaleX, scaleY, (unsigned)[color unsignedIntegerValue], (Gosu::AlphaMode)alphaMode);
}

- (void)drawText:(NSString *)text x:(CGFloat)x y:(CGFloat)y z:(CGFloat)z relativeX:(CGFloat)relativeX relativeY:(CGFloat)relativeY scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY color:(id)color mode:(NSUInteger)alphaMode
{
    NSParameterAssert(text);
    
    _font->drawRel(Gosu::utf8ToWstring([text UTF8String]), x, y, z, relativeX, relativeY, scaleX, scaleY, (unsigned)[color unsignedIntegerValue], (Gosu::AlphaMode)alphaMode);
}

#pragma mark - Instance methods

- (id)initWithHeight:(NSInteger)height fontName:(NSString *)name flags:(NSUInteger)flags
{
    NSParameterAssert(name);
    
    if ((self = [super init])) {
        _font.reset(new Gosu::Font((unsigned)height, Gosu::utf8ToWstring([name UTF8String]), (unsigned)flags));
    }
    return self;
}

- (void)setImage:(GSKImage *)image forCharacter:(unichar)character
{
    NSParameterAssert(image);
    
    _font->setImage(character, [image underlyingGosuImage]);
}

- (CGFloat)textWidth:(NSString *)text scaleX:(CGFloat)scaleX
{
    NSParameterAssert(text);
    
    return _font->textWidth(Gosu::utf8ToWstring([text UTF8String])) * scaleX;
}


@end
