class Currency < ApplicationRecord
  has_many :currency_pairs, foreign_key: 'base_id', class_name: 'CurrencyPair'
  has_many :currency_pairs, foreign_key: 'quote_id', class_name: 'CurrencyPair'

  validates :name, :sign, :code, presence: true
  validates :code, uniqueness: true

  validates :code, length: { is: 3 }

end
