#import <Foundation/Foundation.h>


@class GSKSampleInstance;


@interface GSKSample : NSObject

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/Sample.html

// Instance methods
- (id)initWithFilename:(NSString *)filename;
- (GSKSampleInstance *)playWithVolume:(float)volume speed:(float)speed loop:(BOOL)loop;
- (GSKSampleInstance *)playWithPan:(float)pan volume:(float)volume speed:(float)speed loop:(BOOL)loop;

@end
