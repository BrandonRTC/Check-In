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

  def get_shift_start
    if Time.now.hour >= 18
      time = Time.now.change({hour: 18})
    elsif Time.now.hour < 18
      unless Time.now.day == 1
        time = Time.now.change({hour: 18, day: Time.now.day - 1})
      else
        new_date = Date.today - 1
        time = Time.now.change({hour: 18, day: new_date.day, month: new_date.month})
      end
    end
    time
  end
      
  def get_tour_time_slots
    minutes = Time.now.min
    if Time.now.hour > 0
      hour = Time.now.hour % 12
    else
      hour = 12
    end

    if minutes >= 45
      return {"#{hour}:30" => 2, "#{hour}:45" => 3}
    elsif minutes >= 30 && minutes < 45
      return {"#{hour}:15" => 1, "#{hour}:30" => 2}
    elsif minutes >= 15 && minutes < 30
      return {"#{hour}:00" => 0, "#{hour}:15" => 1}
    else
      return {"#{(hour - 1)}:45" => 3, "#{hour}:00" => 0}
    end
  end

end
