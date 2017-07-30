class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = User.find_with_favorites.find(params[:id])
    @favorited_movies = @user.favorites.map(&:movie)
  end
  
end
