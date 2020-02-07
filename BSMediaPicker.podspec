Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "BSMediaPicker"
s.summary = "BSMediaPicker lets a user select photos and videos from their device."
s.requires_arc = true
s.version = "0.1.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Brandon Stillitano" => "b.stillitano95@gmail.com" }
s.homepage = "https://github.com/bstillitano/BSMediaPicker"
s.source = { :git => "https://github.com/bstillitano/BSMediaPicker.git",
             :tag => "#{s.version}" }
s.framework = "Foundation"
s.framework = "UIKit"
s.framework = "MobileCoreServices"
s.source_files = "BSMediaPicker/**/*.{swift}"
s.resources = "BSMediaPicker/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
s.swift_version = "5.0"

end
