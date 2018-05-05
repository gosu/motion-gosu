# motion-gosu & GosuKit

motion-gosu is a set of RubyMotion wrapper classes GosuKit, which itself is an Objective-C wrapper layer around Gosu.
This combination can be used to compile Ruby/Gosu games for macOS and iOS.
The resulting games can then be published on the iOS and macOS App Stores (in theory – nobody has tried this yet).

## Project Setup

RubyMotion projects work a little differently than normal Ruby/Gosu projects.
[Please take a look at the example project](https://github.com/gosu/motion-gosu/tree/master/example) that you can use as a template for your own projects.

Steps to run the example project:

* [`example.rb`](https://github.com/gosu/motion-gosu/blob/master/example/example.rb) is a ‘classic’ Ruby/Gosu script that can be run without RubyMotion.
  This is useful during development because it reduces friction (no compilation).
  This script uses `require_relative` to include files from the `src` folder, and loads media files from the `media` folder.
  Run the game using: `brew install sdl2; gem install gosu; ./example.rb`
* Both the [`osx`](https://github.com/gosu/motion-gosu/tree/master/example/osx) and [`ios`](https://github.com/gosu/motion-gosu/tree/master/example/ios) subfolders contain RubyMotion projects which use Gosu through a combination of Bundler and CocoaPods.
* To install the latest version of `gosu-motion` (the Ruby wrapper around GosuKit), go into each folder and run `bundle update`.
* To install the latest version of Gosu (the C++ core) and GosuKit (the Objective-C wrapper), run `bundle exec rake pod:update`.
* You can then run the macOS and iOS versions of the game using `bundle exec rake` in either directory.

Note that both `ios/resources/media` and `osx/resources/media` are simply [symbolic links](https://en.wikipedia.org/wiki/Symbolic_link#POSIX_and_Unix-like_operating_systems) that point to the root `media` directory.

While most of the template project can be copied for your own projects, you will always need to update [`osx/Rakefile`](https://github.com/gosu/motion-gosu/blob/master/example/osx/Rakefile) and [`ios/Rakefile`](https://github.com/gosu/motion-gosu/blob/master/example/ios/Rakefile), which contain the RubyMotion project configuration.

## Resources

The example project is not ready to be uploaded to the App Store – it has no icon, for example.
These parts of the RubyMotion project setup are outside of motion-gosu’s scope.
Please look at the [RubyMotion developer guides](http://www.rubymotion.com/developers/guides/) and join the [Motioneers Slack channel](https://motioneers.herokuapp.com) for further assistance.

## Beware

This project is work in progress right now, and debugging Ruby/Gosu games with RubyMotion has proven quite painful.
Feel free to send a pull request if you know how to make things a little smoother, or [let me know](mailto:julian@raschke.de) if you need commercial support.

## License

MIT.
