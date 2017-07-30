module UsersHelper
  def get_favorited_movies
    @favorited_movies.collect do |movie|
      content_tag(:li) do
        link_to movie.title, movie
      end
    end
  end
end
