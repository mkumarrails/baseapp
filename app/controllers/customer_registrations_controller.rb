class CustomerRegistrationsController < ApplicationController

	def create
		@customer = Customer.new(params[:uuid])
		if @customer.save
			render :action => :new
		else
			render :action => :new
		end
	end
end
