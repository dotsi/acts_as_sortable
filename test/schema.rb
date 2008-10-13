ActiveRecord::Schema.define(:version => 0) do
  create_table :things, :force => true do |t|
    t.string    :sortable_string
    t.integer   :sortable_integer
    t.datetime  :sortable_datetime
  end
end