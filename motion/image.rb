module Gosu
  class Image < GosuImage
    # Fix argument lists
    def initialize(filename, flags = {})
      filename = NSBundle.mainBundle.pathForResource(filename, ofType: nil)
      initWithFilename(filename, tileable: flags[:tileable])
    end
    # TODO: Support for mode
    def draw(x, y, z, scale_x = 1, scale_y = 1, color = 0xff_ffffff)
      drawAtX(x, y: y, z: z, scaleX: scale_x, scaleY: scale_y, color: color, mode: 0)
    end    
    # TODO: Support for mode
    def draw_rot(x, y, z, angle, center_x = 0.5, center_y = 0.5, scale_x = 1, scale_y = 1, color = 0xff_ffffff)
      drawRotatedAtX(x, y: y, z: z, angle: angle, centerX: center_x, centerY: center_y, scaleX: scale_x, scaleY: scale_y, color: color, mode: 0)
    end    
  end
end
