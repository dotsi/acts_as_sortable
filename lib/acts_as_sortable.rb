module ActsAsSortable # :nodoc:
  def self.included(base) # :nodoc:
    base.send :extend, ActsAsSortable::ClassMethods
  end

  module ClassMethods # :nodoc:
    def acts_as_sortable(*order)
      return if self.included_modules.include?(ActsAsSortable::InstanceMethods)
      send :include, ActsAsSortable::InstanceMethods

      # There must be a better way to do this...
      cattr_accessor :sortable_order
      self.sortable_order = order.select { |method| self.new.respond_to?(method) }
    end
  end
  
  module InstanceMethods # :nodoc:
    def <=>(o)
      sortable_order.each do |sortable|
        cmp = self.send(sortable) <=> o.send(sortable)
        return cmp unless cmp == 0
      end
    end
  end
  
end