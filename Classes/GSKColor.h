#import <Foundation/Foundation.h>


@interface GSKColor : NSObject <NSCopying, NSMutableCopying>

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/Color.html

// Properties
@property (nonatomic, readonly) NSInteger alpha;
@property (nonatomic, readonly) NSInteger red;
@property (nonatomic, readonly) NSInteger blue;
@property (nonatomic, readonly) NSInteger green;
@property (nonatomic, readonly) CGFloat hue;
@property (nonatomic, readonly) CGFloat saturation;
@property (nonatomic, readonly) CGFloat value;

// Creating colors
- (id)initWithARGB:(NSUInteger)argb;
- (id)initWithAlpha:(NSInteger)alpha red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
- (id)initWithAlpha:(NSInteger)alpha hue:(CGFloat)hue saturation:(CGFloat)saturation value:(CGFloat)value;

// Instance methods
- (NSUInteger)gl;

@end
