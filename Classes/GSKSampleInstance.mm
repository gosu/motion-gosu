#import "GSKSampleInstance.h"
#import <Gosu/Audio.hpp>
#import <memory>


@implementation GSKSampleInstance
{
    std::unique_ptr<Gosu::SampleInstance> _instance;
}

#pragma mark - Internal Helpers

- (id)initWithSampleInstance:(Gosu::SampleInstance)instance;
{
    if ((self = [super init])) {
        _instance.reset(new Gosu::SampleInstance(instance));
    }
    return self;
}

#pragma mark - Properties

- (BOOL)isPaused
{
    return _instance->paused();
}

- (BOOL)isPlaying
{
    return _instance->playing();
}

- (void)setPan:(float)pan
{
    _instance->change_pan(pan);
}

- (void)setSpeed:(float)speed
{
    _instance->change_speed(speed);
}

- (void)setVolume:(float)volume
{
    _instance->change_volume(volume);
}

#pragma mark - Instance methods

- (void)pause
{
    _instance->pause();
}

- (void)resume
{
    _instance->resume();
}

- (void)stop
{
    _instance->stop();
}

@end
