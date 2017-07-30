module ActorsHelper
   def get_movies
    @actor.movies.collect do |movie|
      content_tag(:li) do
        link_to movie.title, movie
      end
    end
  end
  
  def get_edit_link(actor)
    link_to "Edit", edit_admin_actor_path(actor), { remote: true, 'data-toggle' =>  "modal", 'data-target' => '#myModal' }
  end
  
  def get_delete_link(actor)
    link_to "Delete", [:admin, actor],remote: true, method: :delete, data: {confirm: 'Are you sure?'}
  end
end
