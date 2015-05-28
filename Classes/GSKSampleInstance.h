#import <Foundation/Foundation.h>


@interface GSKSampleInstance : NSObject

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/SampleInstance.html

// Properties

@property (nonatomic, readonly, getter=isPaused) BOOL paused;
@property (nonatomic, readonly, getter=isPlaying) BOOL playing;

- (void)setPan:(float)pan;
- (void)setSpeed:(float)speed;
- (void)setVolume:(float)volume;

// Instance methods

- (void)pause;
- (void)resume;
- (void)stop;

@end
