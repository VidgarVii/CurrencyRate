class CreateCurrencyPairs < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_pairs do |t|
      t.integer :base_id, null: false
      t.integer :quote_id, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end
