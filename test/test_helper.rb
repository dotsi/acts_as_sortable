ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..'

require 'test/unit'
require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb'))

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")

db_adapter = ENV['DB']

# TODO refactor this silliness
db_adapter ||= 
  begin 
    require 'rubygems'
    require 'sqlite3'
  rescue MissingSourceFile 
    begin 
      require 'sqlite' 
    rescue MissingSourceFile 
    end 
  end

if db_adapter.nil?
  raise "No DB Adapter selected. Pass the DB= option to pick one, or install Sqlite or Sqlite3." 
end

ActiveRecord::Base.establish_connection(config[db_adapter])

load(File.dirname(__FILE__) + "/schema.rb")

require File.dirname(__FILE__) + '/../init.rb'

class Thing < ActiveRecord::Base
  acts_as_sortable :sortable_string, :sortable_integer, :sortable_datetime
end