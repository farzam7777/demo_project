class Api::SessionsController < Api::BaseController
  before_filter :ensure_params_exist
  
  def create
    user = User.find_for_database_authentication(:email => params[:user_login][:email])
    return invalid_login_attempt unless user

    if user.valid_password?(params[:user_login][:password])
      user.auth_token = SecureRandom.urlsafe_base64
      user.save
      render json: user
      return
    end
    invalid_login_attempt
  end
  
  protected
    
    def ensure_params_exist
      return unless params[:user_login].blank?
        render :json=>{success: false, message: "missing user_login parameter"}, status: 422
      end
    
    def invalid_login_attempt
      render :json=> {success: false, message: "Error with your login or password"}, status: 401
    end
end
