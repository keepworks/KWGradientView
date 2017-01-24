Pod::Spec.new do |s|
  s.name             = 'KWGradientView'
  s.version          = '0.1.3'
  s.summary          = 'Subclass of UIView to add gradient to your views'

  s.description      = <<-DESC
Create horizontal, vertical & diagonal gradients on your view using this UIView subclass.
                       DESC

  s.homepage         = 'https://github.com/keepworks/KWGradientView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KeepWorks' => 'ios@keepworks.com' }
  s.source           = { :git => 'https://github.com/keepworks/KWGradientView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'KWGradientView/Views/KWGradientView.swift'

end