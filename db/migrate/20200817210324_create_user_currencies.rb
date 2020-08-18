class CreateUserCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :user_currencies do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :currency_id
      t.timestamps
    end
  end
end
