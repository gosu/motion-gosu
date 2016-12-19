#import <GosuKit/GosuKit.h>
#import <Gosu/Gosu.hpp>


#pragma mark - Math

extern "C" CGFloat GSKGetAngle(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2)
{
    return Gosu::angle(x1, y1, x2, y2);
}

extern "C" CGFloat GSKGetAngleDifference(CGFloat angle1, CGFloat angle2)
{
    return Gosu::angle_diff(angle1, angle2);
}

extern "C" CGFloat GSKGetDistance(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2)
{
    return Gosu::distance(x1, y1, x2, y2);
}

extern "C" CGFloat GSKGetOffsetX(CGFloat angle, CGFloat radius)
{
    return Gosu::offset_x(angle, radius);
}

extern "C" CGFloat GSKGetOffsetY(CGFloat angle, CGFloat radius)
{
    return Gosu::offset_y(angle, radius);
}

extern "C" CGFloat GSKRandom(CGFloat min, CGFloat max)
{
    return Gosu::random(min, max);
}

#pragma mark - Available screen space

extern "C" NSInteger GSKGetAvailableHeight()
{
    return Gosu::available_height();
}

extern "C" NSInteger GSKGetAvailableWidth()
{
    return Gosu::available_width();
}

extern "C" NSInteger GSKGetScreenHeight()
{
    return Gosu::screen_height();
}

extern "C" NSInteger GSKGetScreenWidth()
{
    return Gosu::screen_width();
}

#pragma mark - Input

extern "C" BOOL GSKIsButtonDown(NSInteger buttonID)
{
    return Gosu::Input::down(Gosu::Button((unsigned)buttonID));
}

extern "C" NSString *GSKGetCharacterFromButtonID(NSInteger buttonID)
{
    std::string string = Gosu::Input::id_to_char(Gosu::Button((unsigned)buttonID));
    return string.empty() ? nil : [NSString stringWithUTF8String:string.c_str()];
}

extern "C" NSInteger GSKGetButtonIDFromCharacter(NSString *c)
{
    return Gosu::Input::char_to_id(c.UTF8String).id();
}

#pragma mark - UI

extern "C" NSString *GSKGetDefaultFontName()
{
    return [NSString stringWithUTF8String:Gosu::default_font_name().c_str()];
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
