Gem::Specification.new do |s|
  s.name          = "halfsies"
  s.summary       = "halfsies watches a folder for you and resizes any images with @2x in the name to half the size. Great for iOS development."
  s.requirements  = [ "imagemagick installed" ]
  s.version       = "0.0.1"
  s.author        = "Anders Svendal"
  s.email         = "anders@tight.no"
  s.homepage      = "https://github.com/anderssvendal/halfsies"
  s.platform      = Gem::Platform::RUBY
  s.files         = Dir['**/**']
  s.executables   = [ 'halfsies' ]

  s.add_dependency('fssm')
  s.add_dependency('rmagick')
end