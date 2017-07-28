class AddIndexToReport < ActiveRecord::Migration
  def change
    add_index :reports, [:user_id, :review_id]
  end
end
