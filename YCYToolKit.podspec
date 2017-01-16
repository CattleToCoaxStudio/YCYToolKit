#
# Be sure to run `pod lib lint YCYToolKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YCYToolKit'
  s.version          = '0.0.1'
  s.summary          = 'YCYToolKit is Tool.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/CattleToCoaxStudio/YCYToolKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chengyou.yang' => '864390553@qq.com' }
  s.source           = { :git => 'https://github.com/CattleToCoaxStudio/YCYToolKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '6.0'

  s.source_files = 'YCYToolKit/YCYToolKit.h'
  
  # s.resource_bundles = {
  #   'YCYToolKit' => ['YCYToolKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.subspec 'YCYCategories' do |category|
    category.source_files = 'YCYToolKit/YCYCategories/YCYCategory.h'
    category.subspec 'UIKit' do |uikit|
#      uikit.source_files = 'YCYToolKit/YCYCategories/UIKit/YCYUIKitHeader.h'
#      uikit.subspec 'UIAlertView' do |ss|
#	ss.source_files = 'YCYToolKit/YCYCategories/UIKit/**/YCYAlert.h'
#        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/**/YCYUIAlertView.h','YCYToolKit/YCYCategories/UIKit/**/UIAlertView+YCYBlock.{h,m}'
#      end
    end
  end
end
