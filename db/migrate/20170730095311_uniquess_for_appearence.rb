class UniquessForAppearence < ActiveRecord::Migration
  def change
    add_index :appearences, [:movie_id, :actor_id], unique: true
  end
end
