#
# Be sure to run `pod lib lint PhotoViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PhotoViewController'
  s.version          = '0.1.1'
  s.summary          = 'PhotoViewController is a controller to display a photo !'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a very small viewController to display images, allowing to zoom on it. It was mainly done in order to first try pod building and publishing. Not very usefull I think, but who really knows :) ?
                       DESC

  s.homepage         = 'https://github.com/nicoduj/PhotoViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nicolas Dujardin' => 'nicolas.dujardin@gmail.com' }
  s.source           = { :git => 'https://github.com/nicoduj/PhotoViewController.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dujnic'

  s.ios.deployment_target = '9.0'

  s.source_files = 'PhotoViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PhotoViewController' => ['PhotoViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
