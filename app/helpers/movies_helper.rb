module MoviesHelper
  def get_trailor(site, youtube_id, vimeo_id)
    if site == "www.youtube.com"      
      content_tag(:p, content_tag(:iframe,'', width: "650", height: "350", src: "http://www.youtube.com/embed/#{youtube_id}", frameborder: "0", allowfullscreen: "true"))
    else
      content_tag(:p, content_tag(:iframe,'', width: "650", height: "350", src: "https://player.vimeo.com/video/#{vimeo_id}", frameborder: "0", webkitallowfullscreen: "true", mozallowfullscreen: "true", allowfullscreen: "true"))
    end
  end
end
