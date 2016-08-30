#
# Be sure to run `pod lib lint SwiftState.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftState'
  s.version          = '0.1.0'
  s.summary          = 'A State Machine Manager for Swift.'

  s.description      = <<-DESC
SwiftState implements a state machine to manage state changes in a Swift Application. By ultilizing unidirectional data flow & usage of value type, SwiftState will helps to make your application easier to understand the logic of the application.
                       DESC

  s.homepage         = 'https://github.com/tuoitrevohoc/SwiftState'
  s.license          = { :type => 'WTFLICENSE', :file => 'LICENSE' }
  s.author           = { 'tuoitrevohoc' => 'tuoitrevohoc@me.com' }
  s.source           = { :git => 'https://github.com/tuoitrevohoc/SwiftState.git', :tag => s.version.to_s }

  s.social_media_url = 'https://twitter.com/tuoitrevohoc'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftState/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
