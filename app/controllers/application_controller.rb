class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :notice => exception.message
  end
  
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:username, :email, :password, :password_confirmation, :gender)}
      devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email, :password, :remember_me)}
      devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:username, :email, :password, :remember_me, :current_password, :gender, :image)}
    end
end
