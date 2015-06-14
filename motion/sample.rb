module Gosu
  class Sample < GSKSample
    def initialize(filename)
      initWithFilename(filename)
    end
    
    def play(volume = 1, speed = 1, looping = false)
      # TODO: This returns GSKSampleInstance, not Gosu::SampleInstance!!
      playWithVolume(volume, speed: speed, loop: looping)
    end
    
    def play_pan(pan = 0, volume = 1, speed = 1, looping = false)
      # TODO: This returns GSKSampleInstance, not Gosu::SampleInstance!!
      playWithPan(pan, volume: volume, speed: speed, loop: looping)
    end
  end
end
