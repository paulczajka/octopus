require "rubygems"
require "bundler/setup"
require "active_record"
require "octopus"
require "support/database_connection"
require "support/octopus_helper"

MIGRATIONS_ROOT = File.expand_path(File.join(File.dirname(__FILE__),  'migrations'))
Octopus.instance_variable_set(:@directory, File.dirname(__FILE__))

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.before(:each) do
    OctopusHelper.clean_all_shards()
  end
end

$: << File.expand_path(File.join(File.dirname(__FILE__), "support"))
