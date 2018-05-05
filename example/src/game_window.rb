# Most common iPad resolution
WIDTH = 1024
HEIGHT = 768

class GameWindow < Gosu::Window
  def initialize
    super(WIDTH, HEIGHT)
    self.caption = "Tutorial Game"
    
    @background_image = Gosu::Image.new("media/space.png", tileable: true)
    
    @player = Player.new
    @player.warp(WIDTH / 2, HEIGHT / 2)
    
    @star_anim = Gosu::Image::load_tiles("media/star.png", 25, 25)
    @stars = Array.new
    
    @font = Gosu::Font.new(20)
  end
  
  def update
    # Touch controls (iOS only): Player follows the first touch.
    if not touches.empty?
      target_touch = touches[0]
      @player.rotate_towards(target_touch.x, target_touch.y)
      @player.accelerate
    end
    
    # Keyboard/gamepad controls.
    if Gosu.button_down? Gosu::KB_LEFT or Gosu.button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu.button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu.button_down? Gosu::GP_BUTTON_0
      @player.accelerate
    end
    @player.move
    @player.collect_stars(@stars)
    
    if rand(100) < 4 and @stars.size < 25
      @stars.push(Star.new(@star_anim))
    end
  end
  
  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND,
      1.0 * WIDTH / @background_image.width,
      1.0 * HEIGHT / @background_image.height)
    @player.draw
    @stars.each { |star| star.draw }
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
  end
  
  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end
