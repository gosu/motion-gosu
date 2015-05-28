#import "GSKSong.h"
#import <Gosu/Gosu.hpp>


static GSKSong *__weak currentSong = nil;


@implementation GSKSong
{
    GOSU_UNIQUE_PTR<Gosu::Song> _song;
}

#pragma mark - Class properties

+ (GSKSong *)currentSong
{
    GSKSong *strongCurrentSong = currentSong;
    if (strongCurrentSong && strongCurrentSong->_song.get() == Gosu::Song::currentSong()) {
        return strongCurrentSong;
    }
    else {
        return nil;
    }
}

#pragma mark - Properties

- (BOOL)isPaused
{
    return _song->paused();
}

- (BOOL)isPlaying
{
    return _song->playing();
}

- (float)volume
{
    return _song->volume();
}

- (void)setVolume:(float)volume
{
    _song->changeVolume(volume);
}

#pragma mark - Instance methods

- (id)initWithFilename:(NSString *)filename
{
    if ((self = [super init])) {
        _song.reset(new Gosu::Song(Gosu::utf8ToWstring([filename UTF8String])));
    }
    return self;
}

- (void)pause
{
    _song->pause();
}

- (void)play:(BOOL)loop
{
    _song->play(loop);
    currentSong = self;
}

- (void)stop
{
    _song->stop();
}

@end
