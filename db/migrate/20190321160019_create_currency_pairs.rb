class CreateCurrencyPairs < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_pairs do |t|
      t.integer :base_id, foreign_key: true, null: false
      t.integer :quote_id, foreign_key: true, null: false
      t.float :price, null: false
      t.string :pair

      t.timestamps
    end

    add_index :currency_pairs, :pair
    add_index :currency_pairs, :base_id
    add_index :currency_pairs, :quote_id
  end
end
