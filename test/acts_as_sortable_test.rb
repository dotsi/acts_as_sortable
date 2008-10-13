require 'test/unit'
require File.dirname(__FILE__) + '/test_helper.rb'

class ActsAsSortableTest < Test::Unit::TestCase

  def setup
    @a = Thing.create( :sortable_string => 'a', :sortable_integer => 1, :sortable_datetime => 3.hours.ago )
    @b = Thing.create( :sortable_string => 'b', :sortable_integer => 2, :sortable_datetime => 2.hours.ago )
    @c = Thing.create( :sortable_string => 'c', :sortable_integer => 3, :sortable_datetime => 1.hours.ago )
    
    @int_a = Thing.create( :sortable_string => 'a', :sortable_integer => 1, :sortable_datetime => 3.hours.ago )
    @int_b = Thing.create( :sortable_string => 'a', :sortable_integer => 2, :sortable_datetime => 3.hours.ago )
    @int_c = Thing.create( :sortable_string => 'a', :sortable_integer => 3, :sortable_datetime => 3.hours.ago )

    @dt_a = Thing.create( :sortable_string => 'a', :sortable_integer => 1, :sortable_datetime => 3.hours.ago )
    @dt_b = Thing.create( :sortable_string => 'a', :sortable_integer => 1, :sortable_datetime => 2.hours.ago )
    @dt_c = Thing.create( :sortable_string => 'a', :sortable_integer => 1, :sortable_datetime => 1.hours.ago )
  end

  def test_sort_by_string_as_first
    assert_equal [@c, @b, @a].sort, [@a, @b, @c]
  end
  
  def test_sort_by_integer_as_second
    assert_equal [@int_c, @int_b, @int_a].sort, [@int_a, @int_b, @int_c]
  end
  
  def test_sort_by_datetime_as_third
    assert_equal [@dt_c, @dt_b, @dt_a].sort, [@dt_a, @dt_b, @dt_c]    
  end
  
end
