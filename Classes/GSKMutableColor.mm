#import "GSKMutableColor.h"
#import <Gosu/Color.hpp>


@interface GSKColor (InternalHelpers)

- (Gosu::Color &)underlyingGosuColor;

@end


@implementation GSKMutableColor

@dynamic alpha;
@dynamic red;
@dynamic green;
@dynamic blue;
@dynamic hue;
@dynamic saturation;
@dynamic value;

- (void)setAlpha:(NSInteger)alpha
{
    [self underlyingGosuColor].set_alpha(alpha);
}

- (void)setRed:(NSInteger)red
{
    [self underlyingGosuColor].set_red(red);
}

- (void)setGreen:(NSInteger)green
{
    [self underlyingGosuColor].set_green(green);
}

- (void)setBlue:(NSInteger)blue
{
    [self underlyingGosuColor].set_blue(blue);
}

- (void)setHue:(CGFloat)hue
{
    [self underlyingGosuColor].set_hue(hue);
}

- (void)setSaturation:(CGFloat)saturation
{
    [self underlyingGosuColor].set_saturation(saturation);
}

- (void)setValue:(CGFloat)value
{
    [self underlyingGosuColor].set_value(value);
}

@end
