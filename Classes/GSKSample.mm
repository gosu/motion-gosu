#import "GSKSample.h"
#import "GSKChannel.h"
#import <Gosu/Gosu.hpp>
#import <memory>


@interface GSKChannel (InternalHelpers)

- (id)initWithChannel:(Gosu::Channel)instance;

@end


@implementation GSKSample
{
    std::unique_ptr<Gosu::Sample> _sample;
}

#pragma mark - Instance methods

- (id)initWithFilename:(NSString *)filename
{
    NSParameterAssert(filename);
    
    if ((self = [super init])) {
        _sample.reset(new Gosu::Sample(filename.UTF8String));
    }
    
    return self;
}

- (GSKChannel *)playWithVolume:(float)volume speed:(float)speed loop:(BOOL)loop
{
    Gosu::Channel channel = _sample->play(volume, speed, loop);
    return [[GSKChannel alloc] initWithChannel:channel];
}

- (GSKChannel *)playWithPan:(float)pan volume:(float)volume speed:(float)speed loop:(BOOL)loop
{
    Gosu::Channel channel = _sample->play_pan(pan, volume, speed, loop);
    return [[GSKChannel alloc] initWithChannel:channel];
}

@end
