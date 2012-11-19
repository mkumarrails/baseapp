class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :uuid, :size => 64
      t.string :email
      t.string :kind

      t.timestamps
    end
  end

end
