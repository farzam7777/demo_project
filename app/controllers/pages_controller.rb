class PagesController < ApplicationController
  def home
    @latest_movies = Movie.latest_movies
  end
end
