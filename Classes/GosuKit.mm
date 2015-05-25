#import <GosuKit/GosuKit.h>
#import <Gosu/Gosu.hpp>

extern "C" NSString *GSKDefaultFontName()
{
    return [NSString stringWithUTF8String:Gosu::wstringToUTF8(Gosu::defaultFontName()).c_str()];
}
