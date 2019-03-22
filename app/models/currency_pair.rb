class CurrencyPair < ApplicationRecord
  belongs_to :base,  class_name: 'Currency', foreign_key: 'base_id'
  belongs_to :quote, class_name: 'Currency', foreign_key: 'quote_id'

  validates :price, presence: true

  after_create :make_pair

  private

  def make_pair
    base = self.base.code + self.quote.code
    update!(pair: base)
  end
end
