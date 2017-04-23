#import "GSKGraphics.h"
#import <Gosu/Graphics.hpp>
#import <Gosu/Image.hpp>


@implementation GSKGraphics

+ (void)drawLineFromX:(CGFloat)x1 y:(CGFloat)y1 color:(id)color1
                  toX:(CGFloat)x2 y:(CGFloat)y2 color:(id)color2
                    z:(CGFloat)z mode:(NSUInteger)alphaMode
{
    Gosu::Graphics::draw_line(x1, y1, (unsigned)[color1 unsignedIntegerValue],
                              x2, y2, (unsigned)[color2 unsignedIntegerValue],
                              z, (Gosu::AlphaMode)alphaMode);
}

+ (void)drawTriangleWithX:(CGFloat)x1 y:(CGFloat)y1 color:(id)color1
                        x:(CGFloat)x2 y:(CGFloat)y2 color:(id)color2
                        x:(CGFloat)x3 y:(CGFloat)y3 color:(id)color3
                        z:(CGFloat)z mode:(NSUInteger)alphaMode
{
    Gosu::Graphics::draw_triangle(x1, y1, (unsigned)[color1 unsignedIntegerValue],
                                  x2, y2, (unsigned)[color2 unsignedIntegerValue],
                                  x3, y3, (unsigned)[color3 unsignedIntegerValue],
                                  z, (Gosu::AlphaMode)alphaMode);
}

+ (void)drawQuadWithX:(CGFloat)x1 y:(CGFloat)y1 color:(id)color1
                    x:(CGFloat)x2 y:(CGFloat)y2 color:(id)color2
                    x:(CGFloat)x3 y:(CGFloat)y3 color:(id)color3
                    x:(CGFloat)x4 y:(CGFloat)y4 color:(id)color4
                    z:(CGFloat)z mode:(NSUInteger)alphaMode
{
    Gosu::Graphics::draw_quad(x1, y1, (unsigned)[color1 unsignedIntegerValue],
                              x2, y2, (unsigned)[color2 unsignedIntegerValue],
                              x3, y3, (unsigned)[color3 unsignedIntegerValue],
                              x4, y4, (unsigned)[color4 unsignedIntegerValue],
                              z, (Gosu::AlphaMode)alphaMode);
}

+ (void)drawRectAtX:(CGFloat)x y:(CGFloat)y
              width:(CGFloat)width height:(CGFloat)height color:(id)color
                  z:(CGFloat)z mode:(NSUInteger)alphaMode
{
    Gosu::Graphics::draw_quad(x, y, (unsigned)[color unsignedIntegerValue],
                              x + width, y, (unsigned)[color unsignedIntegerValue],
                              x, y + height, (unsigned)[color unsignedIntegerValue],
                              x + width, y + height, (unsigned)[color unsignedIntegerValue],
                              z, (Gosu::AlphaMode)alphaMode);
}

+ (void)flush
{
    Gosu::Graphics::flush();
}

+ (void)clipToX:(CGFloat)x y:(CGFloat)y
          width:(CGFloat)width height:(CGFloat)height
        perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::clip_to(x, y, width, height, block);
}

+ (void)performGL:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::gl(block);
}

+ (void)scheduleGL:(void (^)())block z:(CGFloat)z
{
    NSParameterAssert(block);
    
    Gosu::Graphics::gl(z, block);
}

+ (void)rotate:(CGFloat)angle aroundX:(CGFloat)x aroundY:(CGFloat)y
       perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::transform(Gosu::rotate(angle, x, y), block);
}

+ (void)scaleX:(CGFloat)scaleX y:(CGFloat)scaleY
       aroundX:(CGFloat)x aroundY:(CGFloat)y
       perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::transform(Gosu::scale(scaleX, scaleY, x, y), block);
}

+ (void)transform:(CGFloat(*)[16])matrix
          perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Transform transform;
    for (int i = 0; i < 16; ++i) {
        transform[i] = (*matrix)[i];
    }
    
    Gosu::Graphics::transform(transform, block);
}

+ (void)translateX:(CGFloat)translateX y:(CGFloat)translateY
           perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::transform(Gosu::translate(translateX, translateY), block);
}

@end
