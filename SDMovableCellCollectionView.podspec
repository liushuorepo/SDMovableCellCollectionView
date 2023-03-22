#
# Be sure to run `pod lib lint SDMovableCellCollectionView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SDMovableCellCollectionView'
  s.version          = '0.1.0'
  s.summary          = 'This is a movable collectionView. You can sort data by dragging and dropping the cell.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This is a movable collectionView. You can sort data by dragging and dropping the cell. Thank you!
                       DESC

  s.homepage         = 'https://github.com/liushuorepo/SDMovableCellCollectionView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liushuo' => '13124832031@163.com' }
  s.source           = { :git => 'https://github.com/liushuo/SDMovableCellCollectionView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SDMovableCellCollectionView/Classes/**/*'
  
  s.user_target_xcconfig = {
      'GENERATE_INFOPLIST_FILE' => 'YES'
  }

  s.pod_target_xcconfig = {
      'GENERATE_INFOPLIST_FILE' => 'YES'
  }
  # s.resource_bundles = {
  #   'SDMovableCellCollectionView' => ['SDMovableCellCollectionView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
