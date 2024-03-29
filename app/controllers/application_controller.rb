class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  #If Can can denies acces redirect to rootpage & throw notive
  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message
  	flash[:error] = "Access denied!"
  end
end