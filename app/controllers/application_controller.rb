class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def login!(user)
  	@current_user = user
  	session[:session_token] = user.session_token
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def signed_in?
    !!current_user
  end

  def current_user
  	return nil if session[:session_token].nil?
  	@current_user ||= User.find_by_session_token(session[:session_token])
  end

  def current_house
    if current_user.permissions == 0
      @current_house == nil
    else
      @current_house ||= House.find_by_permission_number(current_user.permissions)
    end
  end

  def require_sign_in!
    redirect_to new_session_url if current_user.nil?
  end

end
