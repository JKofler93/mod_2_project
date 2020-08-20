class ChangePasswordColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password_digest, :password_field
  end
end
