class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user



private

def current_user
	if !request.ssl? || cookies.signed[:secure_user_id] == "secure#{session[:user_id]}"
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
end
