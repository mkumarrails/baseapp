class AddTagsToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :tags, :string, :array => true
  end
end
