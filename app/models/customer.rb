class Customer < ActiveRecord::Base
  attr_accessible  :kind, :uuid, :content, :email
  validates :email, :presence => true, :uniqueness => true, :email_format => true
  serialize :content, ActiveRecord::Coders::Hstore
end
