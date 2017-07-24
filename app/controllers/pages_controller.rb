class PagesController < ApplicationController
  def home
    @latest_movies = Movie.latest_movies
    @featured_movies = Movie.featured_movies
  end
end
