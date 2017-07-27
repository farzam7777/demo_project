class Admin::UsersController < Admin::BaseController
  before_filter :find_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all.page(params[:page]).per(2)
  end
  
  def edit
  end
  
  def update
    @user.update_attributes(user_params)
  
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: "User is Successfully Updated." }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to admin_users_path, notice: "User is Successfully Deleted." }
        format.js
      else
        format.html { redirect_to admin_users_path, notice: "Some Problem Occured while deleting User." }
        format.js
      end
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:email, :username, :gender)
    end
    
    def find_user
      @user = User.find(params[:id])
    end
end
