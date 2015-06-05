module Gosu
  class Window < GSKWindow
    # Fix argument lists
    def initialize(width, height, flags = {})
      initWithWidth(width, height: height, fullscreen: flags[:fullscreen])
    end
    
    # Fix names
    def fullscreen?; isFullscreen; end
    def mouse_x; mouseX; end
    def mouse_x=(x); setMouseX(x); end
    def mouse_y; mouseY; end
    def mouse_y=(y); setMouseY(y); end
    def update_interval; updateInterval; end
    
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
  end
end
