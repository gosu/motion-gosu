#import <Foundation/Foundation.h>


@interface GSKSong : NSObject

// This interface is organised as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/Song.html

// Class properties

+ (GSKSong *)currentSong;

// Properties

@property (nonatomic, readonly, getter=isPaused) BOOL paused;
@property (nonatomic, readonly, getter=isPlaying) BOOL playing;
@property (nonatomic) float volume;

// Instance methods

- (id)initWithFilename:(NSString *)filename;

- (void)pause;
- (void)play:(BOOL)loop;
- (void)stop;

@end
