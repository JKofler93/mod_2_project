class RemoveColumnPassword < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password_digest, :string
    add_column :users, :password, :password_digest
  end
end
