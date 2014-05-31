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
  app.name = 'briefly-ios'
  app.identifier = 'nz.co.briefly'
  #app.entitlements['aps-environment'] = 'development'
  app.frameworks += ['AdSupport', 'CoreLocation']
  app.vendor_project('vendor/Carnival.framework', :static, products: ['Carnival'], headers_dir: 'Headers')
end
