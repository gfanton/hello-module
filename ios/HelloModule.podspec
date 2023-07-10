require 'json'

package = JSON.parse(File.read(File.join(__dir__, '..', 'package.json')))

Pod::Spec.new do |s|
  s.name           = 'HelloModule'
  s.version        = package['version']
  s.summary        = package['description']
  s.description    = package['description']
  s.license        = package['license']
  s.author         = package['author']
  s.homepage       = package['homepage']
  s.platform       = :ios, '13.0'
  s.swift_version  = '5.4'
  s.source         = { git: 'https://github.com/gfanton/hello-gomobile' }
  s.static_framework = true

  s.dependency 'ExpoModulesCore'

  # Swift/Objective-C compatibility
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'SWIFT_COMPILATION_MODE' => 'wholemodule',
  }
  s.source_files = 'src/**/*.{h,m,mm,swift}'

  s.prepare_command = 'make -C .. build.ios'
  s.vendored_frameworks = "Frameworks/Hello.xcframework"
  s.preserve_paths = 'Frameworks/Hello.xcframework'

end


# headers = 'Frameworks/Hello.xcframework/ios-arm64/Hello.framework/Versions/A/Headers'

# s.private_header_files = "#{headers}/*.h"
# s.source_files = '*.{h,m,mm,swift}',"#{headers}/*.h"
# s.ios.vendored_frameworks = "Frameworks/Hello.xcframework"
# s.preserve_paths = 'Frameworks/Hello.xcframework'
# s.pod_target_xcconfig = {
#   'DEFINES_MODULE' => 'YES',
#   'SWIFT_COMPILATION_MODE' => 'wholemodule',
# }

# s.source_files   = '*.{h,m,mm,swift}'

# s.vendored_frameworks = 'Frameworks/Hello/Hello.xcframework'
# s.preserve_paths = 'Frameworks/Hello/Hello.xcframework'
# s.xcconfig = {
#   'OTHER_LDFLAGS' => '-framework Hello.xcframework',
#   'DEFINES_MODULE' => 'YES',
#   'SWIFT_COMPILATION_MODE' => 'wholemodule',
# }
