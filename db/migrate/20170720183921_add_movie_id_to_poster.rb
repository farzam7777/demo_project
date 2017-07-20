class AddMovieIdToPoster < ActiveRecord::Migration
  def change
    add_column :posters, :movie_id, :integer, index: true
  end
end
