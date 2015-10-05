Pod::Spec.new do |s|
  s.name             = "LFSideViewController"
  s.version          = "1.0.0"
  s.summary          = "iOS 8 side menu."
  s.homepage         = "https://github.com/luisfcofv/LFSideViewController"
  s.screenshots      = "https://raw.githubusercontent.com/luisfcofv/LFSideViewController/master/LFSideViewController.gif"
  s.license          = 'MIT'
  s.author           = { "Luis Flores" => "me@luisflores.mx" }
  s.source           = { :git => "https://github.com/luisfcofv/LFSideViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/luisfcofv'
  s.platform         = :ios, '8.0'
  s.requires_arc     = true
  s.source_files     = 'LFSideViewController/*'
  s.frameworks       = 'UIKit'
end
