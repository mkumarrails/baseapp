class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :uuid, :size => 64
      t.integer :parent_id
      t.string :kind
      t.hstore :data
      t.string :tags, :array => true

      t.timestamps
    end
  end
end
