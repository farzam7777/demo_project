class AddFeaturedColumnToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :featured, :boolean, default: false;
  end
end
