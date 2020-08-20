class RemoveColumnPassword2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password, :digest
    add_column :users, :password, :string
  end
end
