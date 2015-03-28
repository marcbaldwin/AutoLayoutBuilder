Pod::Spec.new do |s|
  s.name         = "AutoLayoutBuilder"
  s.version      = "1.0.0"
  s.license      = "MIT"
  s.summary      = "Create adaptive layouts with an expressive yet concise syntax."
  s.homepage     = "https://github.com/marcbaldwin/AutoLayoutBuilder"
  s.author       = { "marcbaldwin" => "marc.baldwin88@gmail.com" }
  s.description  = %{
    AutoLayoutBuilder is an expressive and concise wrapper for Apple's AutoLayout.
    It provides shorthand notation for creating readable, flexible layouts.
  }

  s.source       = { :git => "https://github.com/marcbaldwin/AutoLayoutBuilder.git", :tag => "v1.0.0" }
  s.source_files = "AutoLayout"

  s.platform     = :ios, '8.0'
  s.frameworks   = "Foundation", "UIKit"
  s.requires_arc = true
end
