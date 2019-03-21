class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name, uniqueness: true , null: false
      t.string :sign, uniqueness: true , null: false
      t.string :code, uniqueness: true , null: false

      t.timestamps
    end
  end
end
