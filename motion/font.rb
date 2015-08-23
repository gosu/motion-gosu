module Gosu
  class Font < GSKFont
    # height() OK
    
    # name() OK
    
    def draw(text, x, y, z, scale_x = 1, scale_y = 1, color = 0xff_ffffff,
        mode = :default)
      
      drawText(text, x: x, y: y, z: z, scaleX: scale_x, scaleY: scale_y,
        color: color, mode: ALPHA_MODE_MAP[mode])
    end
    
    def draw_rel(text, x, y, z, rel_x, rel_y, scale_x = 1, scale_y = 1,
        color = 0xff_ffffff, mode = :default)
      
      drawText(text, x: x, y: y, z: z, relativeX: rel_x, relativeY: rel_y,
        scaleX: scale_x, scaleY: scale_y, color: color, mode: ALPHA_MODE_MAP[mode])
    end
    
    def []=(character, image)
      setImage(image, forCharacter: character.ord)
    end
    
    def initialize(height, options = {})
      initWithHeight(height, fontName: options[:font] || GSKGetDefaultFontName(), flags: 0)
    end
    
    def text_width(text, scale_x = 1)
      textWidth(text, scaleX: scale_x)
    end
  end
end
