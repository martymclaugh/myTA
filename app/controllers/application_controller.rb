class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def logged_in?
    session[:teacher_id].present?
  end
  helper_method :logged_in?
end
