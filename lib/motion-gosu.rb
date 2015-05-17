if not defined? Motion::Project::Config
  raise "This file must be required within a RubyMotion project Rakefile."
end

motion_dir = File.join(File.expand_path('../../motion', __FILE__))

Motion::Project::App.setup do |app|
  app.files.concat Dir.glob("#{motion_dir}/**/*.rb")
  
  if App.template == :osx
    # Later: Copy OS X specific files...
  elsif App.template == :ios
    # Later: Copy iOS specific files...
  else
    raise "Incompatible platform: #{App.template}"
  end
end
