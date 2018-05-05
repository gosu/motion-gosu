#!/usr/bin/env ruby

require "gosu"

require_relative "src/z_order"
require_relative "src/player"
require_relative "src/star"
require_relative "src/game_window"

if __FILE__ == $PROGRAM_NAME
  GameWindow.new.show
end
