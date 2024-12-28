#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint ngenius_payment_gatway.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'ngenius_payment_gatway'
  s.version          = '0.0.1'
  s.summary          = 'NGenius payment gateway Flutter plugin'
  s.description      = <<-DESC
NGenius payment gateway integration for Flutter.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'NISdk'
  s.platform = :ios, '12.0'
  s.swift_version = '5.0'

  # Include the NGenius SDK
  s.preserve_paths = 'NISdk.framework'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework NISdk' }
  s.vendored_frameworks = 'NISdk.framework'
end
