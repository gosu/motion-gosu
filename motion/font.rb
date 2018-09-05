module Gosu
  class Font < GSKFont
    # height() OK
    
    # name() OK
    
    def draw_text(text, x, y, z, scale_x = 1, scale_y = 1, color = 0xff_ffffff,
        mode = :default)
      
      drawText(text, x: x, y: y, z: z, scaleX: scale_x, scaleY: scale_y,
        color: color, mode: ALPHA_MODE_MAP[mode])
    end
    
    alias_method :draw, :draw_text
    alias_method :draw_markup, :draw_text
    
    def draw_text_rel(text, x, y, z, rel_x, rel_y, scale_x = 1, scale_y = 1,
        color = 0xff_ffffff, mode = :default)
      
      drawText(text, x: x, y: y, z: z, relativeX: rel_x, relativeY: rel_y,
        scaleX: scale_x, scaleY: scale_y, color: color, mode: ALPHA_MODE_MAP[mode])
    end
    
    def []=(character, image)
      setImage(image, forCharacter: character.ord)
    end
    
    def initialize(height, options = {})
      flags = 0
      flags |= 1 if options[:bold]
      flags |= 2 if options[:italic]
      flags |= 4 if options[:underline]
      initWithHeight(height, fontName: options[:name] || GSKGetDefaultFontName(), flags: flags)
    end
    
    def text_width(text, scale_x = 1)
      textWidth(text, scaleX: scale_x)
    end
    
    def markup_width(text, scale_x = 1)
      textWidth(text, scaleX: scale_x)
    end
  end
end
