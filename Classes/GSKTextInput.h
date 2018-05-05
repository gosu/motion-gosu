#import <Foundation/Foundation.h>

@interface GSKTextInput : NSObject

// This interface is organized as in Gosu's Ruby reference:
// https://www.libgosu.org/rdoc/Gosu/TextInput.html

// Properties
@property (nonatomic) NSInteger caretPos;
@property (nonatomic) NSInteger selectionStart;
@property (nonatomic, copy) NSString *text;

// Instance methods
- (NSString *)filter:(NSString *)text;
- (void)insertText:(NSString *)text;
- (void)deleteForward;
- (void)deleteBackward;

@end
