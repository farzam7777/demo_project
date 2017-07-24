module AdminsHelper
  def get_featured_link(movie)
    if movie.featured?
      link_to "Mark Un-Feature", mark_unfeature_admin_movie_path(movie), method: :post, id: "unfeature_movie_#{movie.id}", remote: true
    else
      link_to "Mark Feature", mark_feature_admin_movie_path(movie), method: :post, id: "feature_movie_#{movie.id}", remote: true
    end
  end
end
