class CurrencyPair < ApplicationRecord
  belongs_to :base,  class_name: 'Currency', foreign_key: 'base_id'
  belongs_to :quote, class_name: 'Currency', foreign_key: 'quote_id'

  validates :price, presence: true
end
