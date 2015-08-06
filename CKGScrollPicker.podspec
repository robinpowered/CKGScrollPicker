#
# Be sure to run `pod lib lint CKGScrollPicker.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CKGScrollPicker"
  s.version          = "0.1.0"
  s.summary          = "CKGScrollPicker allows you to scroll through a list of options to select one."
  s.description      = <<-DESC
                       CKGScrollPicker allows you to scroll through a list of options to select one. You can also tap an option to select it and scroll to it.

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/ckguo/CKGScrollPicker"
  s.license          = 'MIT'
  s.author           = { "Courtney Guo" => "courtneyguo96@gmail.com" }
  s.source           = { :git => "https://github.com/ckguo/CKGScrollPicker.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'CKGScrollPicker' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'FLKAutoLayout'
end
