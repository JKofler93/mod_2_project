class UpdateColumnType < ActiveRecord::Migration[6.0]
  def change
    remove_column :currencies, :type, :string
    add_column :currencies, :crypto, :string
  end
end
