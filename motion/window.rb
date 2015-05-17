module Gosu
  class Window < GosuWindow
    # Fix argument lists
    def initialize(width, height, flags = {})
      initWithWidth(width, height: height, fullscreen: flags[:fullscreen])
    end
    
    # Fix names
    alias fullscreen? isFullscreen
    
    def mouse_x; mouseY; end
    def mouse_x=(v); setMouseX(v); end
    
    alias mouse_y mouseY
    alias mouse_y= setMouseY
    alias update_interval updateInterval
    
    # Forward callbacks
    def button_down(id); end
    def buttonDown(id)
      button_down(id)
    end
    
    def button_up(id); end
    def buttonUp(id)
      button_up(id)
    end
    
    def needsCursor
      if self.respond_to? :needs_cursor?
        self.needs_cursor?
      else
        super
      end
    end
    
    def needsRedraw
      if self.respond_to? :needs_redraw?
        self.needs_redraw?
      else
        super
      end
    end
  end
end
