class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
	#complete this method
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def is_user_logged_in?
	#complete this method
  	logged_in = false
	if logged_in then true else redirect_to root_path end 
  end
end
