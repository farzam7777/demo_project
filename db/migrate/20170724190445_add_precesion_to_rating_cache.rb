class AddPrecesionToRatingCache < ActiveRecord::Migration
  def change
    change_column :rating_caches , :avg, :decimal, precision: 5, scale: 2
  end
end
