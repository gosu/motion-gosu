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
    [self underlyingGosuColor].setAlpha(alpha);
}

- (void)setRed:(NSInteger)red
{
    [self underlyingGosuColor].setRed(red);
}

- (void)setGreen:(NSInteger)green
{
    [self underlyingGosuColor].setGreen(green);
}

- (void)setBlue:(NSInteger)blue
{
    [self underlyingGosuColor].setBlue(blue);
}

- (void)setHue:(CGFloat)hue
{
    [self underlyingGosuColor].setHue(hue);
}

- (void)setSaturation:(CGFloat)saturation
{
    [self underlyingGosuColor].setSaturation(saturation);
}

- (void)setValue:(CGFloat)value
{
    [self underlyingGosuColor].setValue(value);
}


@end
