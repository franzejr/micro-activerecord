require 'bundler/setup'
require 'pry'
require "#{File.dirname(__FILE__)}/../lib/micro_active_record"
require 'models/simple_sample'
require 'models/sample_without_columns'

Bundler.setup

RSpec.configure do |config|
end
