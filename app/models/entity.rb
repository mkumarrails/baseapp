class Entity < ActiveRecord::Base
  attr_accessible :uuid, :parent_id, :kind, :data, :tags
  serialize :data, ActiveRecord::Coders::Hstore
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Entity"
  has_many :children, :foreign_key => "parent_id", :class_name => "Entity"
end
