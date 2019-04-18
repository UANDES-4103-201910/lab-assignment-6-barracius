class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def index

  end

  def current_user
	#complete this method
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def is_user_logged_in?
	#complete this method
    if current_user.nil?
      return false
    else
      return true
    end
  end
end 
