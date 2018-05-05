#import "GSKTextInput.h"
#import <Gosu/Gosu.hpp>


namespace
{
    class CallbackForwardingTextInput : public Gosu::TextInput
    {
        GSKTextInput *const _text_input;
        
    public:
        CallbackForwardingTextInput(GSKTextInput *text_input)
        : _text_input(text_input)
        {
        }
        
        std::string filter(std::string text_in) const override
        {
            return [_text_input filter:[NSString stringWithUTF8String:text_in.c_str()]].UTF8String ?: "";
        }
    };
}


@implementation GSKTextInput
{
    std::unique_ptr<CallbackForwardingTextInput> _textInput;
}

#pragma mark - Properties

- (NSInteger)caretPos
{
    return _textInput->caret_pos();
}

- (void)setCaretPos:(NSInteger)caretPos
{
    _textInput->set_caret_pos((unsigned)caretPos);
}

- (NSInteger)selectionStart
{
    return _textInput->selection_start();
}

- (void)setSelectionStart:(NSInteger)selectionStart
{
    _textInput->set_selection_start((unsigned)selectionStart);
}

- (NSString *)text
{
    return [NSString stringWithUTF8String:_textInput->text().c_str()];
}

- (void)setText:(NSString *)text
{
    _textInput->set_text(text.UTF8String ?: "");
}

#pragma mark - Instance methods

- (instancetype)init
{
    if (self = [super init]) {
        _textInput.reset(new CallbackForwardingTextInput(self));
    }
    return self;
}

- (NSString *)filter:(NSString *)text
{
    return text;
}

- (void)insertText:(NSString *)text
{
    _textInput->insert_text(text.UTF8String ?: "");
}

- (void)deleteForward
{
    _textInput->delete_forward();
}

- (void)deleteBackward
{
    _textInput->delete_backward();
}

#pragma mark - Internal helpers

- (Gosu::TextInput &)underlyingGosuTextInput
{
    return *_textInput;
}

@end
