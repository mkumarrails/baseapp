class AddTagsToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :tags, :integer, :array => true
  end
end
