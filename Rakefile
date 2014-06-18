# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

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
  app.testflight do
    app.testflight.api_token = ENV['TESTFLIGHT_API_KEY']
    app.testflight.team_token = ENV['TESTFLIGHT_TEAM_KEY']
    app.testflight.app_token = ENV['TESTFLIGHT_APP_KEY']
  end
end
