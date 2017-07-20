class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :isAdmin, :integer, :default => 0
  end
end
