require 'composite_primary_keys'
class Customer < ActiveRecord::Base
  #include ActiveUUID::UUID
  self.primary_keys = 'uuid'
  attr_accessible  :kind, :uuid
  belongs_to :sender
  validates :uuid, :presence => true, :uniqueness => true, :email_format => true
end
