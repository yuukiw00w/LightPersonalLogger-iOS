platform :ios, '13.0'

# don't use dynamic frameworks
use_frameworks!

# disable warnings from libraries
inhibit_all_warnings!

target 'LightPersonalLogger' do
  pod 'SwiftFormat/CLI'
  pod 'SwiftGen'
  pod 'SwiftLint'
end

post_install do | installer |
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # https://stackoverflow.com/questions/63607158/xcode-12-building-for-ios-simulator-but-linking-in-object-file-built-for-ios
      # https://github.com/realm/realm-cocoa/issues/6685#issuecomment-695915227
      # Xcode 12でarm64対応するようにビルドしちゃってエラーになるのでexclude 
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
 
      # https://qiita.com/temoki/items/46ad22940e819a132435
      # Xcode 12でiOS8が切られてなおiOS8をサポートしてるライブラリがあるため
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
 
  # https://github.com/CocoaPods/CocoaPods/issues/8674#issuecomment-524097348
  # trick: never be asked to migrate the Swift version of Pods targets
  installer.pods_project.root_object.attributes['LastSwiftMigration'] = 9999
  installer.pods_project.root_object.attributes['LastSwiftUpdateCheck'] = 9999
  installer.pods_project.root_object.attributes['LastUpgradeCheck'] = 9999
end
