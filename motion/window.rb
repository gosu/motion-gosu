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
    
    def self.new(*args)
      w = self.alloc
      w.initialize(*args)
      w
    end
    
    def initialize(width, height, flags = {})
      initWithWidth(width, height: height, fullscreen: flags[:fullscreen],
        updateInterval: flags[:update_interval] || 16.6666666)
    end
    
    # show() OK
    
    def touch_began(touch); end
    def touchBegan(touch)
      touch_began(touch)
    end
    def touch_moved(touch); end
    def touchMoved(touch)
      touch_moved(touch)
    end
    def touch_ended(touch); end
    def touchEnded(touch)
      touch_ended(touch)
    end
    def touch_cancelled(touch); end
    def touchCancelled(touch)
      touch_cancelled(touch)
    end
  end
end
