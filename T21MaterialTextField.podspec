
Pod::Spec.new do |s|

  s.name         = "T21MaterialTextField"
  s.version      = "1.0.0"
  s.summary      = "T21MaterialTextField is a subclass of the original Textfield class from the public 3rd party Material framework. It provides different TextField states (enabled, active, error) to help configuring the textfield in a real app."
  s.author    = "Eloi Guzman Ceron"
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/worldline-spain/T21MaterialTextField.git", :tag => "1.0.0" }
  s.source_files  = "Classes", "src/**/*.{swift}"
  s.framework  = "UIKit"
  s.requires_arc = true
  s.dependency "Material" , "~>2.0"

end
