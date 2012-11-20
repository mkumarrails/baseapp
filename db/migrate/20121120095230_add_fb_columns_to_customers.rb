class AddFbColumnsToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :first_name, :string
  	add_column :customers, :last_name, :string
  	add_column :customers, :uid, :string
  	add_column :customers, :oauth_token, :string
  	add_column :customers, :provider, :string
  	add_column :customers, :oauth_expires_at, :datetime
  end
end