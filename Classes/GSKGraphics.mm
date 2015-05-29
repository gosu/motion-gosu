#import "GSKGraphics.h"
#import "GSKImage.h"
#import <Gosu/Graphics.hpp>
#import <Gosu/Image.hpp>


@interface GSKImage (InternalHelpers)

- (id)initWithGosuImage:(Gosu::Image)image;
- (Gosu::Image &)underlyingGosuImage;

@end


@implementation GSKGraphics

+ (void)drawLineFromX:(CGFloat)x1 y:(CGFloat)y1 color:(id)color1
                  toX:(CGFloat)x2 y:(CGFloat)y2 color:(id)color2
                    z:(CGFloat)z mode:(NSUInteger)alphaMode
{
    Gosu::Graphics::drawLine(x1, y1, (unsigned)[color1 unsignedIntegerValue],
                             x2, y2, (unsigned)[color2 unsignedIntegerValue],
                             z, (Gosu::AlphaMode)alphaMode);
}

+ (void)drawTriangleWithX:(CGFloat)x1 y:(CGFloat)y1 color:(id)color1
                        x:(CGFloat)x2 y:(CGFloat)y2 color:(id)color2
                        x:(CGFloat)x3 y:(CGFloat)y3 color:(id)color3
                        z:(CGFloat)z mode:(NSUInteger)alphaMode
{
    Gosu::Graphics::drawTriangle(x1, y1, (unsigned)[color1 unsignedIntegerValue],
                                 x2, y2, (unsigned)[color2 unsignedIntegerValue],
                                 x3, y3, (unsigned)[color3 unsignedIntegerValue],
                                 z, (Gosu::AlphaMode)alphaMode);
}

+ (void)drawQuadWithX:(CGFloat)x1 y:(CGFloat)y1 color:(id)color1
                  toX:(CGFloat)x2 y:(CGFloat)y2 color:(id)color2
                  toX:(CGFloat)x3 y:(CGFloat)y3 color:(id)color3
                  toX:(CGFloat)x4 y:(CGFloat)y4 color:(id)color4
                    z:(CGFloat)z mode:(NSUInteger)alphaMode
{
    Gosu::Graphics::drawQuad(x1, y1, (unsigned)[color1 unsignedIntegerValue],
                             x2, y2, (unsigned)[color2 unsignedIntegerValue],
                             x3, y3, (unsigned)[color3 unsignedIntegerValue],
                             x4, y4, (unsigned)[color4 unsignedIntegerValue],
                             z, (Gosu::AlphaMode)alphaMode);
}

+ (void)drawRectFromX:(CGFloat)x y:(CGFloat)y
                width:(CGFloat)width height:(CGFloat)height color:(id)color
                    z:(CGFloat)z mode:(NSUInteger)alphaMode
{
    Gosu::Graphics::drawQuad(x, y, (unsigned)[color unsignedIntegerValue],
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
    
    Gosu::Graphics::beginClipping(x, y, width, height);
    block();
    Gosu::Graphics::endClipping();
}

+ (void)performGL:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::beginGL();
    block();
    Gosu::Graphics::endClipping();
}

/*
  Commented out until I completely understand how to keep the block alive for
  just the right amount of time. Is Objective-C++ really smart by default?!
 
+ (void)scheduleGL:(void (^)())block z:(CGFloat)z
{
    NSParameterAssert(block);
    
    Gosu::Graphics::scheduleGL(block, z);
}
 */

+ (GSKImage *)recordWithWidth:(NSInteger)width height:(NSInteger)height
                      perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::beginRecording();
    block();
    Gosu::Image image(Gosu::Graphics::endRecording((int)width, (int)height));
    
    return [[GSKImage alloc] initWithGosuImage:image];
}

+ (void)rotateBy:(CGFloat)angle aroundX:(CGFloat)x aroundY:(CGFloat)y
         perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::pushTransform(Gosu::rotate(angle, x, y));
    block();
    Gosu::Graphics::popTransform();
}

+ (void)scaleX:(CGFloat)scaleX y:(CGFloat)scaleY
       perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::pushTransform(Gosu::scale(scaleX, scaleY));
    block();
    Gosu::Graphics::popTransform();
}

+ (void)transform:(CGFloat(*)[16])matrix
          perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Transform transform;
    for (int i = 0; i < 16; ++i) {
        transform[i] = (*matrix)[i];
    }
    
    Gosu::Graphics::pushTransform(transform);
    block();
    Gosu::Graphics::popTransform();
}

+ (void)translateBy:(CGFloat)translateX y:(CGFloat)translateY
            perform:(void (^)())block
{
    NSParameterAssert(block);
    
    Gosu::Graphics::pushTransform(Gosu::translate(translateX, translateY));
    block();
    Gosu::Graphics::popTransform();
}

@end
