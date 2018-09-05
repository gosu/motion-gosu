module Gosu
  class Image < GSKImage
    # width() OK
    
    # height() OK

    def self.from_text(text, line_height, options = {})
      flags = 0
      flags |= 1 if options[:bold]
      flags |= 2 if options[:italic]
      flags |= 4 if options[:underline]
      
      self.imageFromText(text, fontName: options[:font] || Gosu.default_font_name, fontFlags: flags,
        lineHeight: line_height, width: options[:width] || -1,
        spacing: options[:spacing] || 0, align: TEXT_ALIGN_MAP[options[:align] || :left])
    end
    
    alias_method :from_markup, :from_text

    def self.load_tiles(source, tile_width, tile_height, options = {})
      # TODO - check whether this returns GSKImage or Gosu::Image
      imagesFromTiles(source, tileWidth: tile_width, tileHeight: tile_height, tileable: options[:tileable])
    end
    
    def initialize(filename, flags = {})
      resource = NSBundle.mainBundle.pathForResource(filename, ofType: nil)
      initWithFilename(resource || filename, tileable: flags[:tileable])
    end
    
    def draw(x, y, z, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default)
      drawAtX(x, y: y, z: z, scaleX: scale_x, scaleY: scale_y, color: color,
        mode: ALPHA_MODE_MAP[mode])
    end
    
    def draw_as_quad(x1, y1, c1, x2, y2, c2, x3, y3, c3, x4, y4, c4, z, mode = :default)
      drawAsQuadWithX(x1, y: y1, color: c1, x: x2, y: y2, color: c2,
        x: x3, y: y3, color: c3, x: x4, y: y4, color: c4, z: z, mode: ALPHA_MODE_MAP[mode])
    end
    
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
