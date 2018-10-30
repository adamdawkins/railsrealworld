class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Make the current_user method available to views also, not just controllers:
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login', alert: "You must be logged in to access this page" if current_user.nil?
  end
end
