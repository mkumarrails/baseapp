OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '174963659310800', 'a89a4ee12004caeca3dbded466e7cf53', :scope => 'email'
end