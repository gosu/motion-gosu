#import <Foundation/Foundation.h>


@interface GSKColor : NSObject

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/Color.html

// Properties
@property (nonatomic) NSInteger alpha;
@property (nonatomic) NSInteger red;
@property (nonatomic) NSInteger blue;
@property (nonatomic) NSInteger green;
@property (nonatomic) CGFloat hue;
@property (nonatomic) CGFloat saturation;
@property (nonatomic) CGFloat value;

// Creating colors
- (id)initWithARGB:(NSUInteger)argb;
- (id)initWithAlpha:(NSInteger)alpha red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
- (id)initWithAlpha:(NSInteger)alpha hue:(CGFloat)hue saturation:(CGFloat)saturation value:(CGFloat)value;

// Instance methods
- (NSUInteger)gl;

@end
