class SessionsController < ApplicationController

  def create
    customer = Customer.from_omniauth(env["omniauth.auth"])
    cookies.permanent.signed[:login] = customer.id.to_s
    redirect_to root_url
  end

end

