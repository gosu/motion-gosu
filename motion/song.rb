module Gosu
  class Song < GSKSong
    def self.current_song
      # TODO - returns GSKSong, not Gosu::Song
      currentSong()
    end
    
    # volume() OK
    
    def initialize(filename)
      initWithFilename(filename)
    end
    
    # pause() OK
    
    def paused?
      isPaused()
    end
    
    # play(loop) TODO - OK?
    
    def playing?
      isPlaying()
    end
    
    # stop() OK
  end
end
