module Gosu
  class Image < GSKImage
    # width() OK
    
    # height() OK

    def self.from_text(text, line_height, options = {})
      if options[:width]
        self.imageFromText(text, fontName: options[:font] || Gosu::default_font_name,
          lineHeight: line_height, width: options[:width],
          spacing: options[:spacing] || 0, align: TEXT_ALIGN_MAP[options[:align] || :left])
      else
        self.imageFromText(text, fontName: options[:font] || Gosu::default_font_name,
          lineHeight: line_height)
      end
    end
    
    def self.load_tiles(source, tile_width, tile_height, options = {})
      # TODO - check whether this returns GSKImage or Gosu::Image
      imagesFromTiles(source, tileWidth: tile_width, tileHeight: tile_height, tileable: options[:tileable])
    end
    
    def initialize(filename, flags = {})
      resource = NSBundle.mainBundle.pathForResource(filename, ofType: nil)
      initWithFilename(resource || filename, tileable: flags[:tileable])
    end
    
    def draw(x, y, z, scale_x = 1, scale_y = 1, color = 0xff_ffffff,
        mode = :default)
    
      drawAtX(x, y: y, z: z, scaleX: scale_x, scaleY: scale_y, color: color,
        mode: ALPHA_MODE_MAP[mode])
    end
    
    # TODO draw_as_quad
    
    def draw_rot(x, y, z, angle, center_x = 0.5, center_y = 0.5, scale_x = 1,
        scale_y = 1, color = 0xff_ffffff, mode = :default)
      
      drawRotatedAtX(x, y: y, z: z, angle: angle, centerX: center_x,
        centerY: center_y, scaleX: scale_x, scaleY: scale_y, color: color,
        mode: ALPHA_MODE_MAP[mode])
    end
    
    # TODO: gl_tex_info
    
    # TODO: insert
    
    # save() OK
    
    # TODO: to_blob
  end
end
