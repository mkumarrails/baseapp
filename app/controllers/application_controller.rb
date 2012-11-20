class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def only_login_customer
    unless current_customer
      redirect_to '/login'  and return
    end
  end

  def current_customer
    # cookies.delete :login
    @current_customer ||= Customer.find(cookies.signed[:login]) if cookies.signed[:login]
  end
  helper_method :current_customer
end
