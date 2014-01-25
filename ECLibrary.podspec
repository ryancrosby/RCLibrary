Pod::Spec.new do |s|
    s.name              = "ECLibrary"
    s.version           = "0.0.1"
    s.description       = "Library of useful objective-c development methods and objects"
    s.summary           = "Library of useful objective-c development methods and objects"
    s.homepage          = "https://github.com/ryancrosby/RCLibrary"
    s.license           = "MIT"
    s.authors           = { "Ryan Crosby" => "ryan@eclecticcoder.com" }
    s.source            = { :git => '~/Development/RCLibrary' }
    s.platform          = :ios
    s.header_dir        = 'ECLibrary'
    s.header_mappings_dir = 'ECLibrary'
    s.source_files      = "ECLibrary/**/*.{h,m}"
    s.preserve_path     = "README.md"
    s.requires_arc      = true
end

    #s.source            = { :git => 'https://github.com/ryancrosby/RCLibrary.git', :tag => '0.0.1' }
