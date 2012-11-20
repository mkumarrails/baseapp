class CustomerRegistrationsController < ApplicationController

  # for customer login
  def index
    if params[:id] && email = $redis.get("login_token:#{params[:id]}")
      url = '/'
      unless c = Customer.find_by_email(email.strip.downcase)
        c = Customer.new
        c.email = email.strip.downcase
        if c.save
          url = '/customers/'+c.id.to_s+'/account'
        else
          redirect_to '/login' and return
        end
      end
      
      #- Log me in
      cookies.permanent.signed[:login] = c.id.to_s
      flash[:notice] = "Welcome"
      
      redirect_to url and return
    elsif params[:id]
      flash[:notice] = 'Your login link has expired. Please login again'
    end
  end

  # for customer signup&login via email
	def create
    if params[:email] && params[:email].strip.downcase =~ /^[\w.!#\$%+-]+@[\w-]+(?:\.[\w-]+)+$/
      CustomerRegistrationMailer.registration_alert(params[:email].strip.downcase).deliver
      render :template => 'customer_registrations/thanks' and return
    end
    render :action => 'index'
	end

	def login
	end
end
