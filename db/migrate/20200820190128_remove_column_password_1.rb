class RemoveColumnPassword1 < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password, :password_digest
    add_column :users, :password, :digest
  end
end
