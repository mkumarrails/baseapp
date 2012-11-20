class Customer < ActiveRecord::Base
  attr_accessible  :kind, :uuid, :data, :email
  validates :email, :uniqueness => true, :email_format => true , :allow_nil => true
  serialize :data, ActiveRecord::Coders::Hstore

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |customer|
      customer.provider = auth.provider
      customer.uid = auth.uid
      customer.first_name = auth.info.first_name
      customer.last_name = auth.info.last_name
      customer.email = auth.info.email
      customer.oauth_token = auth.credentials.token
      customer.oauth_expires_at = Time.at(auth.credentials.expires_at)
      customer.save!
    end
  end

end
