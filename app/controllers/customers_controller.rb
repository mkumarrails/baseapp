class CustomersController < ApplicationController

  before_filter :only_login_customer
  before_filter :is_account_owner, :only => [:account]

  def account
  end

  private

  def is_account_owner
    redirect_to root_url unless current_customer.id.to_s == params[:customer_id].to_s
  end
end
