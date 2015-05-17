#import <Foundation/Foundation.h>


@interface GosuColor : NSObject

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/Color.html

// Properties
@property (nonatomic) NSInteger alpha;
@property (nonatomic) NSInteger red;
@property (nonatomic) NSInteger blue;
@property (nonatomic) NSInteger green;
@property (nonatomic) NSInteger hue;
@property (nonatomic) NSInteger saturation;
@property (nonatomic) NSInteger value;

// Creating colors
+ (instancetype)colorWithARGB:(NSUInteger)argb;
+ (instancetype)colorWithRGBA:(NSUInteger)rgba;
+ (instancetype)colorWithAlpha:(NSInteger)alpha red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
+ (instancetype)colorWithAlpha:(NSInteger)alpha hue:(NSInteger)hue saturation:(NSInteger)saturation value:(NSInteger)value;

// Instance methods
- (NSUInteger)gl;

@end
