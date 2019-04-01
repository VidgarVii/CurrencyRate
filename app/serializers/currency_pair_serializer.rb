class CurrencyPairSerializer < ActiveModel::Serializer
  attributes %i[pair price]

  belongs_to :base
  belongs_to :quote
end
