class AddDataToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :data, :hstore
  end
end
