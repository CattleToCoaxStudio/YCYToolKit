#
# Be sure to run `pod lib lint YCYToolKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YCYToolKit'
  s.version          = '0.1.4'
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

  s.ios.deployment_target = '7.0'

  s.source_files = 'YCYToolKit/YCYToolKit.h'
  
  # s.resource_bundles = {
  #   'YCYToolKit' => ['YCYToolKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.subspec 'YCYCategories' do |category|
    category.source_files = 'YCYToolKit/YCYCategories/YCYCategory.h'
    category.subspec 'UIKit' do |uikit|
      uikit.source_files = 'YCYToolKit/YCYCategories/UIKit/YCYUIKitHeader.h'
      uikit.subspec 'UIAlertView' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIAlertView/**/*'
      end
      uikit.subspec 'UIApplication' do |ss|
	ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIApplication/**/*'
      end
      uikit.subspec 'UIBarButtonItem' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIBarButtonItem/**/*'
      end
      uikit.subspec 'UIBezierPath' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIBezierPath/**/*'
      end
      uikit.subspec 'UIButton' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIButton/**/*'
      end
      uikit.subspec 'UIColor' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIColor/**/*'
      end
      uikit.subspec 'UIControl' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIControl/**/*'
      end
      uikit.subspec 'UIDevice' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIDevice/**/*'
      end
      uikit.subspec 'UIFont' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIFont/**/*'
      end
      uikit.subspec 'UIImage' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIImage/**/*'
      end
      uikit.subspec 'UIImageView' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIImageView/**/*'
      end
      uikit.subspec 'UILabel' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UILabel/**/*'
      end
      uikit.subspec 'UINavigationBar' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UINavigationBar/**/*'
      end
      uikit.subspec 'UINavigationController' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UINavigationController/**/*'
      end
      uikit.subspec 'UIResponder' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIResponder/**/*'
      end
      uikit.subspec 'UIScreen' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIScreen/**/*'
      end
      uikit.subspec 'UIScrollView' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIScrollView/**/*'
      end
      uikit.subspec 'UISearchBar' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UISearchBar/**/*'
      end
      uikit.subspec 'UITableViewCell' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UITableViewCell/**/*'
      end
      uikit.subspec 'UITextField' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UITextField/**/*'
      end
      uikit.subspec 'UITextView' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UITextView/**/*'
      end
      uikit.subspec 'UIView' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIView/**/*'
      end
      uikit.subspec 'UIViewController' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIDevice/UIDevice+YCYHardware.h','YCYToolKit/YCYCategories/UIKit/UIViewController/**/*'
      end
      uikit.subspec 'UIWebView' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIColor/UIColor+YCYWeb.h','YCYToolKit/YCYCategories/UIKit/UIWebView/**/*'
      end
      uikit.subspec 'UIWindow' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/UIKit/UIWindow/**/*'
      end
    end
    category.subspec 'Foundation' do |foundation|
      foundation.source_files = 'YCYToolKit/YCYCategories/Foundation/YCYFoundationHeader.h'
      foundation.subspec 'NSArray' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSArray/**/*'
      end
      foundation.subspec 'NSBundle' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSBundle/**/*'  
      end
      foundation.subspec 'NSData' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSData/**/*'  
      end
      foundation.subspec 'NSDate' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSDate/**/*'  
      end
      foundation.subspec 'NSDateFormatter' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSDateFormatter/**/*'  
      end
      foundation.subspec 'NSDictionary' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSDictionary/**/*'  
      end
      foundation.subspec 'NSFileManager' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSFileManager/**/*'  
      end
      foundation.subspec 'NSIndexPath' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSIndexPath/**/*'  
      end
      foundation.subspec 'NSNotificationCenter' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSNotificationCenter/**/*'  
      end
      foundation.subspec 'NSObject' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSObject/**/*'  
      end
      foundation.subspec 'NSRunloop' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSRunloop/**/*'  
      end
      foundation.subspec 'NSString' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSString/**/*','YCYToolKit/YCYCategories/Foundation/NSData/NSData+{YCYBase64,YCYEncrypt}.h'  
      end
      foundation.subspec 'NSTimer' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSTimer/**/*'  
      end
      foundation.subspec 'NSURL' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSURL/**/*'  
      end
      foundation.subspec 'NSURLConnection' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSURLConnection/**/*'  
      end
      foundation.subspec 'NSURLSession' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSURLSession/**/*'  
      end
      foundation.subspec 'NSUserDefaults' do |ss|
        ss.source_files = 'YCYToolKit/YCYCategories/Foundation/NSUserDefaults/**/*'  
      end
    end
  end
#  s.subspec 'YCYBaseUtils' do |baseutil|
#    baseutil.source_files = 'YCYToolKit/YCYBaseUtils/**/*'
#  end
  s.subspec 'YCYMacro' do |macro|
    macro.source_files = 'YCYToolKit/YCYMacro/**/*'
  end
#  s.subspec 'YCYResources' do |resource|
#    resource.source_files = 'YCYToolKit/YCYResources/**/*'
#  end
end
