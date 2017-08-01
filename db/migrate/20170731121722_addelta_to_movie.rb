class AddeltaToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :delta, :boolean, default: true, null: false
    add_column :actors, :delta, :boolean, default: true, null: false
  end
end
