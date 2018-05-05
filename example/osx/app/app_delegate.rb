class AppDelegate
  def applicationDidFinishLaunching(notification)
    # This makes it possible to load resources from "media/foo.png" etc.
    Dir.chdir(NSBundle.mainBundle.resourceURL.path)
    
    GameWindow.new.show
    
    NSApp.stop(nil)
  end
end
