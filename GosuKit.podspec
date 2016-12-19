Pod::Spec.new do |s|
  s.name         = "GosuKit"
  s.version      = "0.0.1"
  s.summary      = "2D game development library."
  s.homepage     = "https://www.libgosu.org/"
  s.documentation_url = 'https://github.com/gosu/motion-gosu'
  
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Julian Raschke" => "julian@raschke.de" }
  
  s.source       = { :git => "https://github.com/gosu/motion-gosu.git" }
  
  s.osx.deployment_target = '10.7'
  s.ios.deployment_target = '8.0'

  s.source_files = "Classes/*.{h,mm}"
end
