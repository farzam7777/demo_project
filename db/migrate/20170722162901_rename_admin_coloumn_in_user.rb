class RenameAdminColoumnInUser < ActiveRecord::Migration
  def change
    rename_column :users, :isAdmin, :is_admin
  end
end
