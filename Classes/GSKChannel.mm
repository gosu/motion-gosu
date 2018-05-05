#import "GSKChannel.h"
#import <Gosu/Audio.hpp>
#import <memory>


@implementation GSKChannel
{
    std::unique_ptr<Gosu::Channel> _channel;
}

#pragma mark - Internal Helpers

- (id)initWithChannel:(Gosu::Channel)channel
{
    if (self = [super init]) {
        _channel.reset(new Gosu::Channel(channel));
    }
    return self;
}

#pragma mark - Properties

- (BOOL)isPaused
{
    return _channel->paused();
}

- (BOOL)isPlaying
{
    return _channel->playing();
}

- (void)setPan:(float)pan
{
    _channel->set_pan(pan);
}

- (void)setSpeed:(float)speed
{
    _channel->set_speed(speed);
}

- (void)setVolume:(float)volume
{
    _channel->set_volume(volume);
}

#pragma mark - Instance methods

- (void)pause
{
    _channel->pause();
}

- (void)resume
{
    _channel->resume();
}

- (void)stop
{
    _channel->stop();
}

@end
