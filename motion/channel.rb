module Gosu
  class Channel < GSKChannel
    # pan=(), speed=(), volume=() OK
    
    # pause() OK
    
    def paused?
      isPaused()
    end
    
    def playing?
      isPlaying()
    end
    
    # resume() OK
    
    # stop() OK
  end
end
