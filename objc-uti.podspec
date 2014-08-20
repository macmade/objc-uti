Pod::Spec.new do |s|
    s.name                  = "objc-uti"
    s.version               = "1.0.1"
    s.summary               = "Objective-C wrapper for Uniform Type Identifiers (UTIs)."
    s.description           = <<-DESC
                              This project consists of an Objective-C wrapper for all the
                              UTI functions available from the `LaunchServices` framework.
                              
                              The goal is to provide an object-oriented approach to the
                              Uniform Type Identifier system, using Objective-C (Foundation)
                              data types, rather than CoreFoundation types, which may be
                              painful to use, especially with ARC.
                              DESC
    s.homepage              = "https://github.com/macmade/objc-uti"
    s.documentation_url     = "http://doc.xs-labs.com/objc-uti/"
    s.license               = "MIT"
    s.author                = "Jean-David Gadina"
    s.social_media_url      = "http://twitter.com/macmade"
    s.ios.deployment_target = "6.0"
    s.osx.deployment_target = "10.7"
    s.source                = { :git => "https://github.com/macmade/objc-uti.git", :tag => "1.0.1" }
    s.source_files          = "UTI/Source/**/*.{h,m}"
    s.requires_arc          = false
end
