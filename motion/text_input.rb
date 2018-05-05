module Gosu
  class TextInput < GSKTextInput
    def caret_pos; caretPos; end
    def caret_pos=(cp); setCaretPos(cp); end
    
    def initialize; init; end
    
    def selection_start; selectionStart; end
    def selection_start=(ss); setSelectionStart(ss); end
    
    # text() OK
    
    # filter(str) OK
    
    def insert_text(text); insertText(text); end
    
    def delete_forward; deleteForward; end
    
    def delete_backward; deleteBackward; end
  end
end
