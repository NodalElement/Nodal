platform :ios, '15.0'
use_frameworks!
inhibit_all_warnings!

def structure
  pod 'SwiftGen'
end

def ui
  pod 'SnapKit'
end

target 'Nodal' do
  structure
  ui
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
