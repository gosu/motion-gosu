#import "GSKSample.h"
#import "GSKSampleInstance.h"
#import <Gosu/Gosu.hpp>
#import <memory>


@interface GSKSampleInstance (InternalHelpers)

- (id)initWithSampleInstance:(Gosu::SampleInstance)instance;

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

- (GSKSampleInstance *)playWithVolume:(float)volume speed:(float)speed loop:(BOOL)loop
{
    Gosu::SampleInstance instance = _sample->play(volume, speed, loop);
    return [[GSKSampleInstance alloc] initWithSampleInstance:instance];
}

- (GSKSampleInstance *)playWithPan:(float)pan volume:(float)volume speed:(float)speed loop:(BOOL)loop
{
    Gosu::SampleInstance instance = _sample->play_pan(pan, volume, speed, loop);
    return [[GSKSampleInstance alloc] initWithSampleInstance:instance];
}

@end
