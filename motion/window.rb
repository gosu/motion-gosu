module Gosu
  class Window < GSKWindow
    # caption() OK

    def fullscreen?; isFullscreen; end
    
    # height() OK

    def mouse_x; mouseX; end
    def mouse_x=(x); setMouseX(x); end
    def mouse_y; mouseY; end
    def mouse_y=(y); setMouseY(y); end
    
    # TODO: text_input

    def update_interval; updateInterval; end
    
    # width() OK
    
    def button_down(id); end
    def buttonDown(id)
      button_down(id)
    end
    def button_up(id); end
    def buttonUp(id)
      button_up(id)
    end
    
    # draw() OK

    def needsCursor
      if self.respond_to? :needs_cursor?
        self.needs_cursor?
      else
        # Preserve default return value
        super
      end
    end
    
    def needsRedraw
      if self.respond_to? :needs_redraw?
        self.needs_redraw?
      else
        # Preserve default return value
        super
      end
    end
    
    # close() OK
    
    def initialize(width, height, flags = {})
      initWithWidth(width, height: height, fullscreen: flags[:fullscreen],
        updateInterval: flags[:update_interval] || 16.6666666)
    end
    
    # show() OK
  end
end
