#import <Foundation/Foundation.h>


@class GSKChannel;


@interface GSKSample : NSObject

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/Sample.html

// Instance methods
- (id)initWithFilename:(NSString *)filename;
- (GSKChannel *)playWithVolume:(float)volume speed:(float)speed loop:(BOOL)loop;
- (GSKChannel *)playWithPan:(float)pan volume:(float)volume speed:(float)speed loop:(BOOL)loop;

@end
