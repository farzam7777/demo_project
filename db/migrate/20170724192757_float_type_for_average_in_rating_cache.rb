class FloatTypeForAverageInRatingCache < ActiveRecord::Migration
  def change
    change_column :rating_caches , :avg, :float, precision: 5, scale: 2
  end
end
