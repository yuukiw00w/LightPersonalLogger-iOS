source "https://rubygems.org"

gem "cocoapods"
gem 'danger'
gem 'danger-swiftlint'
gem "fastlane"

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
