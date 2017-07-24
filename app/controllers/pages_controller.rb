class PagesController < ApplicationController
  def home
    @latest_movies = Movie.limited_latest_movies
    @featured_movies = Movie.limited_featured_movies
  end
end
