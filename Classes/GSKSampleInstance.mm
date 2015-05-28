#import "GSKSampleInstance.h"
#import <Gosu/Audio.hpp>


@implementation GSKSampleInstance
{
    GOSU_UNIQUE_PTR<Gosu::SampleInstance> _instance;
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
    _instance->changePan(pan);
}

- (void)setSpeed:(float)speed
{
    _instance->changeSpeed(speed);
}

- (void)setVolume:(float)volume
{
    _instance->changeVolume(volume);
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
