class AddIndexToReview < ActiveRecord::Migration
  def change
    add_index :reviews, [:user_id, :movie_id]
  end
end
