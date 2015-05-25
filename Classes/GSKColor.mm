#import "GSKColor.h"
#import <Gosu/Color.hpp>


@implementation GSKColor
{
    Gosu::Color _color;
}

#pragma mark - Properties

- (NSInteger)alpha
{
    return _color.alpha();
}

- (void)setAlpha:(NSInteger)alpha
{
    _color.setAlpha(alpha);
}

- (NSInteger)red
{
    return _color.red();
}

- (void)setRed:(NSInteger)red
{
    _color.setRed(red);
}

- (NSInteger)green
{
    return _color.green();
}

- (void)setGreen:(NSInteger)green
{
    _color.setGreen(green);
}

- (NSInteger)blue
{
    return _color.blue();
}

- (void)setBlue:(NSInteger)blue
{
    _color.setBlue(blue);
}

- (CGFloat)hue
{
    return _color.hue();
}

- (void)setHue:(CGFloat)hue
{
    _color.setHue(hue);
}

- (CGFloat)saturation
{
    return _color.saturation();
}

- (void)setSaturation:(CGFloat)saturation
{
    _color.setSaturation(saturation);
}

- (CGFloat)value
{
    return _color.value();
}

- (void)setValue:(CGFloat)value
{
    _color.setValue(value);
}

#pragma mark - Creating colors

- (id)initWithARGB:(NSUInteger)argb
{
    if ((self = [super init])) {
        _color = (unsigned)argb;
    }
    return self;
}

- (id)initWithRGBA:(NSUInteger)rgba
{
    if ((self = [super init])) {
        _color = Gosu::Color(((rgba >> 8) & 0xffffff) | ((rgba << 24) & 0xff000000));
    }
    return self;
}

- (id)initWithAlpha:(NSInteger)alpha red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue
{
    if ((self = [super init])) {
        _color = Gosu::Color(alpha, red, green, blue);
    }
    return self;
}

- (id)initWithAlpha:(NSInteger)alpha hue:(CGFloat)hue saturation:(CGFloat)saturation value:(CGFloat)value
{
    if ((self = [super init])) {
        _color = Gosu::Color::fromAHSV(alpha, hue, saturation, value);
    }
    return self;
}

#pragma mark - Instance methods

- (NSUInteger)gl
{
    return _color.gl();
}

#pragma mark - Internal helpers

- (NSUInteger)unsignedIntegerValue
{
    return _color.argb();
}

@end
