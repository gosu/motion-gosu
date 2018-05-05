class AppDelegate
  def application(application, didFinishLaunchingWithOptions: launchOptions)
    # This makes it possible to load resources from "media/foo.png" etc.
    Dir.chdir(NSBundle.mainBundle.resourceURL.path)

    @window = GameWindow.new

    # Show the UIWindow that Gosu::Window internally created for us.
    @window.uikit_window.makeKeyAndVisible

    true
  end
end
