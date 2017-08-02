class AddAuthTokenToUser < ActiveRecord::Migration
  def change
    add_column("users", "auth_token", :string, limit: 25)
  end
end
