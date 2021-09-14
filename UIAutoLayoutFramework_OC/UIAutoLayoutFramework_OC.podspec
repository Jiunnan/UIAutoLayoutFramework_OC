Pod::Spec.new do |spec|

  spec.name         = "UIAutoLayoutFramework_OC"
  spec.version      = "1.0.0"
  spec.summary      = "This is the test framework."
  spec.description  = "This is test framework."

  spec.homepage     = "https://github.com/Jiunnan/UIAutoLayoutFramework_OC"
  spec.license      = "MIT"
  spec.author             = { "林俊男" => "john74111@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/Jiunnan/UIAutoLayoutFramework_OC.git", :tag => spec.version.to_s }
  spec.source_files  = "UIAutoLayoutFramework_OC/**/*.[h,m]"
  spec.swift_versions = "5.0"
end
