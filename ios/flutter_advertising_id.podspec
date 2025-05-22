#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_advertising_id.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_advertising_id'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin to access advertising ID.Wraps ASIdentifierManager.advertisingIdentifier (on iOS) and advertising ID (on Android).'
  s.description      = <<-DESC
A Flutter plugin to access advertising ID.Wraps ASIdentifierManager.advertisingIdentifier (on iOS) and advertising ID (on Android).
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_advertising_id/Sources/flutter_advertising_id/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '14.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'flutter_advertising_id_privacy' => ['flutter_advertising_id/Sources/flutter_advertising_id/PrivacyInfo.xcprivacy']}
end
