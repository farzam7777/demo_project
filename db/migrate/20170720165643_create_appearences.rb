class CreateAppearences < ActiveRecord::Migration
  def change
    create_table :appearences do |t|
      t.integer :movie_id, index: true
      t.integer :actor_id, index: true

      t.timestamps null: false
    end
  end
end
