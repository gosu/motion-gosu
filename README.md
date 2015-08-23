# GosuKit & motion-gosu

## GosuKit

GosuKit is an Objective-C wrapper around the Gosu library (C++). It looks reasonably pretty, and in theory you could use Objective-C or Swift to write Gosu games now:

```objc
GSKImage *myImage = [[GSKImage alloc] initWithFilename:@"media/starfighter.bmp" tileable:NO];
```

However, GosuKit's public interface is neither awesome nor stable. It is only meant to be used as stepping stone for the other project in this repository:

## motion-gosu

This is a set of Ruby wrapper classes around GosuKit to emulate [Gosu's familiar Ruby interface](https://libgosu.org/rdoc/). So the line above would become:

```ruby
image = Gosu::Image.new("media/starfighter.bmp", tileable: false)
```

With GosuKit and motion-gosu, RubyMotion can be used to compile Ruby/Gosu games for OS X (iOS coming soon, not sure about Android). Submitting these games to the App Store should work just fine...if you can get everything to work.

## Setup

(For now this only works with OS X projects:)

Gosu and GosuKit are packaged as CocoaPods, even though they are not in the public CocoaPods repository (yet?). First, add CocoaPods support and the `motion-gosu` wrapper to your `Gemfile`:

```ruby
# Add your dependencies here:
gem 'motion-cocoapods'
gem 'motion-gosu', git: 'https://github.com/gosu/motion-gosu'
```

Now add Gosu, GosuKit and SDL 2 to your `App.setup` block in your `Rakefile`:

```ruby
app.libs << '/usr/local/lib/libSDL2.a'

app.pods do
  pod 'Gosu/Gosu', git: 'https://github.com/gosu/gosu'
  pod 'GosuKit', git: 'https://github.com/gosu/motion-gosu'
end
```

(This assumes you have installed SDL 2 via `brew install sdl2`, or better, `brew install sdl2 --HEAD`.)

Then run `bundle exec rake pod:install` and RubyMotion should set up all the libraries.

Now you can set up a `Gosu::Window` instead of `NSWindow` in `AppDelegate#applicationDidFinishLaunching`, and `show()` it.

Note: You can drop your media files (PNG, OGG etc.) in the `resources` folder that RubyMotion creates by default, but you will have to `chdir` into the Resources folder if you want to use relative paths like `Gosu::Image.new('player.png')` to load them.

Note: OS X apps do not quit by default when the window is closed, you have to manually call `NSApplication#stop` to do so.

An example `AppDelegate` class might look like this:

```ruby
class AppDelegate
  def applicationDidFinishLaunching(notification)
    Dir.chdir(NSBundle.mainBundle.resourceURL.path)
    Window.new.show
    NSApp.stop(nil)
  end
end
```

## Beware

This project is work in progress right now, and debugging Ruby/Gosu games with RubyMotion has proven quite painful. Feel free to send a Pull Request if you know how to make things a little smoother.

## License

MIT.
