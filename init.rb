$:.unshift "#{File.dirname(__FILE__)}/lib"
require 'acts_as_sortable'
ActiveRecord::Base.send :include, ActsAsSortable