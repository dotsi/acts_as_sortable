module ActsAsSortable
  def self.included(base)
    base.send :extend, ActsAsSortable::ClassMethods
  end

  module ClassMethods
    def acts_as_sortable(*order)
      cattr_accessor :sortable_order
      self.sortable_order = order
      send :include, ActsAsSortable::InstanceMethods
    end
  end
  
  module InstanceMethods
    def <=>(o)
      sortable_order.each do |sortable|
        cmp = self.send(sortable) <=> o.send(sortable)
        return cmp unless cmp == 0
      end
    end
  end
  
end