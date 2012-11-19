class Customer < ActiveRecord::Base
  attr_accessible  :kind, :uuid
  validates :email, :presence => true, :uniqueness => true, :email_format => true
end
