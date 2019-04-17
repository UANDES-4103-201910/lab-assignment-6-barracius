class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
	    if params[:registrations][:name].blank? or params[:registrations][:last_name].blank? or params[:registrations][:password].blank? or params[:registrations][:phone].blank? or params[:registrations][:email].blank?
	    	flash[:notice] = "All fields must be filled"
	    	render 'new'
		else
			@user = User.new
			@user.name = params[:registrations][:name]
			@user.last_name = params[:registrations][:last_name]
			@user.password = params[:registrations][:password]
			@user.email = params[:registrations][:email]
			@user.phone = params[:registrations][:phone]
			if @user.save!
				flash[:notice] = "User created"
				redirect_to root_url
			else
				flash[:notice] = "Validation error"
				render 'new'
			end
		end

	end
end
