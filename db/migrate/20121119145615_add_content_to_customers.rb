class AddContentToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :content, :hstore
  end
end
