#import "GSKWindow.h"
#import "GSKTouch.h"
#import <Gosu/Gosu.hpp>
#import <map>
#import <memory>


namespace
{
    class CallbackForwardingWindow : public Gosu::Window
    {
        GSKWindow *const _window;
        std::map<void *, GSKTouch *> _touchesMap;
        NSMutableArray<GSKTouch *> *_touchesArray = [NSMutableArray new];
        
    public:
        CallbackForwardingWindow(GSKWindow *window, unsigned width, unsigned height, bool fullscreen, double updateInterval)
        : Gosu::Window(width, height, fullscreen, updateInterval), _window(window)
        {
        }
        
        void button_down(Gosu::Button btn) override
        {
            [_window buttonDown:btn.id()];
        }
        
        void button_up(Gosu::Button btn) override
        {
            [_window buttonUp:btn.id()];
        }
        
        void draw() override
        {
            [_window draw];
        }
        
        bool needs_cursor() const override
        {
            return [_window needsCursor];
        }
        
        bool needs_redraw() const override
        {
            return [_window needsRedraw];
        }
        
        void update() override
        {
            [_window update];
        }
        
        void touch_began(Gosu::Touch touch) override
        {
            GSKTouch *touchObject = [GSKTouch new];
            touchObject.x = touch.x;
            touchObject.y = touch.y;
            _touchesMap[touch.id] = touchObject;
            [_touchesArray addObject:touchObject];
            [_window touchBegan:touchObject];
        }
        
        void touch_moved(Gosu::Touch touch) override
        {
            if (GSKTouch *touchObject = _touchesMap[touch.id]) {
                touchObject.x = touch.x;
                touchObject.y = touch.y;
                [_window touchMoved:touchObject];
            }
        }
        
        void touch_ended(Gosu::Touch touch) override
        {
            if (GSKTouch *touchObject = _touchesMap[touch.id]) {
                _touchesMap.erase(touch.id);
                [_touchesArray removeObject:touchObject];
                touchObject.x = touch.x;
                touchObject.y = touch.y;
                [_window touchEnded:touchObject];
            }
        }
        
        void touch_cancelled(Gosu::Touch touch) override
        {
            if (GSKTouch *touchObject = _touchesMap[touch.id]) {
                _touchesMap.erase(touch.id);
                [_touchesArray removeObject:touchObject];
                touchObject.x = touch.x;
                touchObject.y = touch.y;
                [_window touchCancelled:touchObject];
            }
        }
        
        NSArray<GSKTouch *> *touches() const
        {
            return _touchesArray;
        }
    };
}


@implementation GSKWindow
{
    std::unique_ptr<CallbackForwardingWindow> _window;
}

#pragma mark - Properties

- (NSString *)caption
{
    return [NSString stringWithUTF8String:_window->caption().c_str()];
}

- (void)setCaption:(NSString *)caption
{
    _window->set_caption(caption.UTF8String);
}

- (BOOL)isFullscreen
{
    return _window->fullscreen();
}

- (NSInteger)height
{
    return _window->graphics().height();
}

- (CGFloat)mouseX
{
    return _window->input().mouse_x();
}

- (void)setMouseX:(CGFloat)mouseX
{
    return _window->input().set_mouse_position(mouseX, _window->input().mouse_y());
}

- (CGFloat)mouseY
{
    return _window->input().mouse_y();
}

- (void)setMouseY:(CGFloat)mouseY
{
    return _window->input().set_mouse_position(_window->input().mouse_x(), mouseY);
}

- (NSTimeInterval)updateInterval
{
    return _window->update_interval();
}

- (NSInteger)width
{
    return _window->graphics().width();
}

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
- (UIWindow *)UIWindow
{
    return (__bridge UIWindow *)_window->UIWindow();
}
#endif

#pragma mark - Callbacks

- (void)buttonDown:(NSInteger)buttonID
{
}

- (void)buttonUp:(NSInteger)buttonID
{
}

- (void)draw
{
}

- (BOOL)needsCursor
{
    return _window->Gosu::Window::needs_cursor();
}

- (BOOL)needsRedraw
{
    return _window->Gosu::Window::needs_redraw();
}

- (void)update
{
}

#pragma mark - Callbacks and methods for iOS only

- (void)touchBegan:(nonnull GSKTouch *)touch
{
}

- (void)touchMoved:(nonnull GSKTouch *)touch
{
}

- (void)touchEnded:(nonnull GSKTouch *)touch
{
}

- (void)touchCancelled:(nonnull GSKTouch *)touch
{
}

- (nonnull NSArray<GSKTouch *> *)touches;
{
    return _window->touches();
}

#pragma mark - Instance methods

- (id)initWithWidth:(NSInteger)width height:(NSInteger)height fullscreen:(BOOL)fullscreen updateInterval:(NSTimeInterval)updateInterval
{
    if ((self = [super init])) {
        _window.reset(new CallbackForwardingWindow(self, (unsigned)width, (unsigned)height, fullscreen, updateInterval));
    }
    return self;
}

- (void)show
{
    _window->show();
}

- (void)close
{
    _window->close();
}

@end
