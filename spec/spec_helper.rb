require 'webcrooker'
require 'fakeweb'

RSpec.configure do |config|
  # Use color
  config.color_enabled = true

  # Use format
  # config.formatter = :documentation # :progress, :html, :textmate
end

# FakeWeb

FakeWeb.allow_net_connect = false

def response_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/responses/' + filename)
  File.read(file_path)
end