Pod::Spec.new do |s|
  s.name         = "GosuKit"
  s.version      = "0.0.1"
  s.summary      = "2D game development library."
  s.homepage     = "http://libgosu.org/"
  s.documentation_url = 'http://libgosu.org/rdoc/'
  
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Julian Raschke" => "julian@raschke.de" }
  
  s.source       = { :git => "https://github.com/jlnr/motion-gosu.git" }
  
  s.source_files = "Classes/*.{h,mm}"
end
