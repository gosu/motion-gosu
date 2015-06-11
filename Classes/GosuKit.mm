#import <GosuKit/GosuKit.h>
#import <Gosu/Gosu.hpp>


#pragma mark - Math

extern "C" CGFloat GSKGetAngle(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2)
{
    return Gosu::angle(x1, y1, x2, y2);
}

extern "C" CGFloat GSKGetAngleDifference(CGFloat angle1, CGFloat angle2)
{
    return Gosu::angleDiff(angle1, angle2);
}

extern "C" CGFloat GSKGetDistance(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2)
{
    return Gosu::distance(x1, y1, x2, y2);
}

extern "C" CGFloat GSKGetOffsetX(CGFloat angle, CGFloat radius)
{
    return Gosu::offsetX(angle, radius);
}

extern "C" CGFloat GSKGetOffsetY(CGFloat angle, CGFloat radius)
{
    return Gosu::offsetY(angle, radius);
}

extern "C" CGFloat GSKRandom(CGFloat min, CGFloat max)
{
    return Gosu::random(min, max);
}

#pragma mark - Available screen space

extern "C" NSInteger GSKGetAvailableHeight()
{
    return Gosu::availableHeight();
}

extern "C" NSInteger GSKGetAvailableWidth()
{
    return Gosu::availableWidth();
}

extern "C" NSInteger GSKGetScreenHeight()
{
    return Gosu::screenHeight();
}

extern "C" NSInteger GSKGetScreenWidth()
{
    return Gosu::screenWidth();
}

#pragma mark - Input

extern "C" BOOL GSKIsButtonDown(NSInteger buttonID)
{
    return Gosu::Input::down(Gosu::Button((unsigned)buttonID));
}

extern "C" unichar GSKGetCharacterFromButtonID(NSInteger buttonID)
{
    return Gosu::Input::idToChar(Gosu::Button((unsigned)buttonID));
}

extern "C" NSInteger GSKGetButtonIDFromCharacter(unichar c)
{
    return Gosu::Input::charToId(c).id();
}

#pragma mark - UI

extern "C" NSString *GSKGetDefaultFontName()
{
    return [NSString stringWithUTF8String:Gosu::wstringToUTF8(Gosu::defaultFontName()).c_str()];
}

extern "C" NSInteger GSKGetFramesPerSecond()
{
    return Gosu::fps();
}

extern "C" NSString *GSKGetLanguage()
{
    return [NSString stringWithUTF8String:Gosu::language().c_str()];
}

extern "C" NSInteger GSKGetMilliseconds()
{
    return Gosu::milliseconds();
}
