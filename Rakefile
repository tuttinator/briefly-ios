# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Dotenv.load

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Briefly'
  app.identifier = 'nz.co.briefly'
  #app.entitlements['aps-environment'] = 'development'
  app.icons = %W(Icon-72.png Icon-76.png Icon-Small-40.png Icon-Small-50.png
                 Icon-Small.png Icon.png Icon-60@2x.png Icon-72@2x.png
                 Icon-76@2x.png Icon-Small-40@2x.png Icon-Small-50@2x.png
                 Icon-Small@2x.png Icon@2x.png)
  app.frameworks += ['AdSupport', 'CoreLocation']
  app.vendor_project('vendor/Carnival.framework', :static, products: ['Carnival'], headers_dir: 'Headers')
end
