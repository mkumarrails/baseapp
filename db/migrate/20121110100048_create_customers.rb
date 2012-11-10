class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers, {:id => false} do |t|
      t.string :uuid, :primary_key => true
      t.string :kind

      t.timestamps
    end
  end

end
