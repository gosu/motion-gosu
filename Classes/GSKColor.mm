#import "GSKColor.h"
#import "GSKMutableColor.h"
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

- (NSInteger)red
{
    return _color.red();
}

- (NSInteger)green
{
    return _color.green();
}

- (NSInteger)blue
{
    return _color.blue();
}

- (CGFloat)hue
{
    return _color.hue();
}

- (CGFloat)saturation
{
    return _color.saturation();
}

- (CGFloat)value
{
    return _color.value();
}

#pragma mark - Creating colors

- (id)initWithARGB:(NSUInteger)argb
{
    if (self = [super init]) {
        _color = (unsigned)argb;
    }
    return self;
}

- (id)initWithRGBA:(NSUInteger)rgba
{
    if (self = [super init]) {
        _color = Gosu::Color(((rgba >> 8) & 0xffffff) | ((rgba << 24) & 0xff000000));
    }
    return self;
}

- (id)initWithAlpha:(NSInteger)alpha red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue
{
    if (self = [super init]) {
        _color = Gosu::Color(alpha, red, green, blue);
    }
    return self;
}

- (id)initWithAlpha:(NSInteger)alpha hue:(CGFloat)hue saturation:(CGFloat)saturation value:(CGFloat)value
{
    if (self = [super init]) {
        _color = Gosu::Color::from_ahsv(alpha, hue, saturation, value);
    }
    return self;
}

#pragma mark - Instance methods

- (NSUInteger)gl
{
    return _color.gl();
}

#pragma mark - Internal helpers

- (NSUInteger)unsignedIntValue
{
    return _color.argb();
}

- (Gosu::Color &)underlyingGosuColor
{
    return _color;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    return [[GSKColor alloc] initWithARGB:_color.argb()];
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [[GSKMutableColor alloc] initWithARGB:_color.argb()];
}

@end
