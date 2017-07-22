class Admin::BaseController < ApplicationController
  before_filter :verify_admin
  before_filter :authenticate_user!
  
  protected
  
    def verify_admin
      redirect_to root_url unless current_user.try(:is_admin?)
    end
end
