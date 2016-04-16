#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


@interface GSKGraphics : NSObject

+ (void)drawLineFromX:(CGFloat)x1 y:(CGFloat)y1 color:(id)color1
                  toX:(CGFloat)x2 y:(CGFloat)y2 color:(id)color2
                    z:(CGFloat)z mode:(NSUInteger)alphaMode;

+ (void)drawTriangleWithX:(CGFloat)x1 y:(CGFloat)y1 color:(id)color1
                        x:(CGFloat)x2 y:(CGFloat)y2 color:(id)color2
                        x:(CGFloat)x3 y:(CGFloat)y3 color:(id)color3
                        z:(CGFloat)z mode:(NSUInteger)alphaMode;

+ (void)drawQuadWithX:(CGFloat)x1 y:(CGFloat)y1 color:(id)color1
                    x:(CGFloat)x2 y:(CGFloat)y2 color:(id)color2
                    x:(CGFloat)x3 y:(CGFloat)y3 color:(id)color3
                    x:(CGFloat)x4 y:(CGFloat)y4 color:(id)color4
                    z:(CGFloat)z mode:(NSUInteger)alphaMode;

+ (void)drawRectAtX:(CGFloat)x y:(CGFloat)y
              width:(CGFloat)width height:(CGFloat)height color:(id)color
                  z:(CGFloat)z mode:(NSUInteger)alphaMode;

+ (void)flush;

+ (void)clipToX:(CGFloat)x y:(CGFloat)y
          width:(CGFloat)width height:(CGFloat)height
        perform:(void (^)())block;

+ (void)performGL:(void (^)())block;
// + (void)scheduleGL:(void (^)())block z:(CGFloat)z;

+ (void)rotate:(CGFloat)angle aroundX:(CGFloat)x aroundY:(CGFloat)y
       perform:(void (^)())block;
+ (void)scaleX:(CGFloat)scaleX y:(CGFloat)scaleY
       aroundX:(CGFloat)x aroundY:(CGFloat)y
       perform:(void (^)())block;
+ (void)transform:(CGFloat(*)[16])matrix
          perform:(void (^)())block;
+ (void)translateX:(CGFloat)translateX y:(CGFloat)translateY
           perform:(void (^)())block;

@end
