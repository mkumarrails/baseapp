class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers, {:id => false} do |t|
      t.string :emp_id
      t.string :first_name

      t.timestamps
    end
    execute "ALTER TABLE employees ADD PRIMARY KEY (emp_id);"  
  end
end
