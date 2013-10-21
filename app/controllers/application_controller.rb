class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :logged_in?, :current_user

  def require_login
    unless logged_in?
      flash[:notice] = "You need to first log in"
      redirect_to problems_path
    end
  end

  def logged_in?
    return true if @current_user

    if cookies[:api_key]
      @current_user = User.where(api_key: cookies[:api_key]).take

      if @current_user
        return true
      end
    end

    false
  end

  def current_user
    @current_user ||= User.where(api_key: cookies[:api_key]).take
  end
end
