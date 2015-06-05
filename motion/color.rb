module Gosu
  class Color < GSKColor
    # Fix argument lists
    def initialize(*args)
      if args.empty?
        init
      elsif args.size == 1
        initWithARGB(args[0])
      elsif args.size == 3
        initWithAlpha(255, red: args[0], green: args[1], blue: args[2])
      elsif args.size == 4
        initWithAlpha(args[0], red: args[1], green: args[2], blue: args[3])
      end
    end
    
    def inspect
      "#<Gosu::Color:ARGB=0x%02x_%02x%02x%02x>" % [self.alpha, self.red, self.green, self.blue]
    end
    
    NONE    = Gosu::Color.new(0x00_000000)
    BLACK   = Gosu::Color.new(0xff_000000)
    GRAY    = Gosu::Color.new(0xff_808080)
    WHITE   = Gosu::Color.new(0xff_ffffff)
    AQUA    = Gosu::Color.new(0xff_00ffff)
    RED     = Gosu::Color.new(0xff_ff0000)
    GREEN   = Gosu::Color.new(0xff_00ff00)
    BLUE    = Gosu::Color.new(0xff_0000ff)
    YELLOW  = Gosu::Color.new(0xff_ffff00)
    FUCHSIA = Gosu::Color.new(0xff_ff00ff)
    CYAN    = Gosu::Color.new(0xff_00ffff)
  end
end