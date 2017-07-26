module MoviesHelper
  def get_trailor(site, youtube_id, vimeo_id)
    if site == "www.youtube.com"      
      content_tag(:p, content_tag(:iframe,'', width: "650", height: "350", src: "http://www.youtube.com/embed/#{youtube_id}", frameborder: "0", allowfullscreen: "true"))
    else
      content_tag(:p, content_tag(:iframe,'', width: "650", height: "350", src: "https://player.vimeo.com/video/#{vimeo_id}", frameborder: "0", webkitallowfullscreen: "true", mozallowfullscreen: "true", allowfullscreen: "true"))
    end
  end
  
  def avg_rating(movie)
    if movie.average('movie').present?
      rating_for movie, 'movie', cancel: false, star: movie.average('movie').avg
    else
      rating_for movie, 'movie', cancel: false, star: 5
    end
  end
  
  def rate(movie)
    rating_for movie, "movie", disable_after_rate: false, imdb_avg: true, enable_half: true
  end
  
  def link_of_edit(review)
    if can? :update, review
      link_to "Edit |", [:edit, @movie, review]
    end
  end
  
  def link_of_delete(review)
    if can? :destroy, review
      link_to "Delete |", [@movie, review], method: :delete, data: {confirm: 'Are you sure?'}, remote: true
    end
  end
  
  def link_of_report(review)
    if user_signed_in?
      link_to "Report", reports_path(review: review, user_id: current_user.id), method: :post, remote: true
    end
  end
  
  def render_reviews_form
    if user_signed_in?
      render 'reviews/form'
    else
      "Log in to share reviews."
    end 
  end
end
