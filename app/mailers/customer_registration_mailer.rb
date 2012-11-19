class CustomerRegistrationMailer < ActionMailer::Base
  default from: "mkumar.ror@gmail.com"

  def registration_alert(email=nil)
    @token = UUIDTools::UUID.random_create.to_s

    if @customer = Customer.find_by_email(email.strip.downcase)
      email = "test@gmail.com"
      @unsubscribe = "/unsubscribe?id=#{@customer.id}&join_token=#{@token}"
      @val = @customer.email
    else
      @val = email
    end
       
    $redis.setex("login_token:#{@token}", 86400, @val)

    mail({
      :to => email,
      :subject => 'Login to BaseApp'
    })  	
  end
end
