#import "GSKWindow.h"
#import "GSKTextInput.h"
#import "GSKTouch.h"
#import <Gosu/Gosu.hpp>
#import <map>
#import <memory>


@interface GSKTextInput (InternalHelpers)

- (Gosu::TextInput &)underlyingGosuTextInput;

@end


namespace
{
    class CallbackForwardingWindow : public Gosu::Window
    {
        GSKWindow *const _window;
        std::map<void *, GSKTouch *> _touches_map;
        NSMutableArray<GSKTouch *> *_touches_array = [NSMutableArray new];
        
    public:
        CallbackForwardingWindow(GSKWindow *window, unsigned width, unsigned height, bool fullscreen, double update_interval)
        : Gosu::Window(width, height, fullscreen, update_interval), _window(window)
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
            _touches_map[touch.id] = touchObject;
            [_touches_array addObject:touchObject];
            [_window touchBegan:touchObject];
        }
        
        void touch_moved(Gosu::Touch touch) override
        {
            if (GSKTouch *touchObject = _touches_map[touch.id]) {
                touchObject.x = touch.x;
                touchObject.y = touch.y;
                [_window touchMoved:touchObject];
            }
        }
        
        void touch_ended(Gosu::Touch touch) override
        {
            if (GSKTouch *touchObject = _touches_map[touch.id]) {
                _touches_map.erase(touch.id);
                [_touches_array removeObject:touchObject];
                touchObject.x = touch.x;
                touchObject.y = touch.y;
                [_window touchEnded:touchObject];
            }
        }
        
        void touch_cancelled(Gosu::Touch touch) override
        {
            if (GSKTouch *touchObject = _touches_map[touch.id]) {
                _touches_map.erase(touch.id);
                [_touches_array removeObject:touchObject];
                touchObject.x = touch.x;
                touchObject.y = touch.y;
                [_window touchCancelled:touchObject];
            }
        }
        
        NSArray<GSKTouch *> *touches() const
        {
            return _touches_array;
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

- (void)setTextInput:(GSKTextInput *)textInput
{
    _window->input().set_text_input(&textInput.underlyingGosuTextInput);
    _textInput = textInput;
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
    return (__bridge UIWindow *)_window->uikit_window();
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
    if (self = [super init]) {
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
