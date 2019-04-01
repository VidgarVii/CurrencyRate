class CurrencySerializer < ActiveModel::Serializer
  attributes %i[id pair price]

  has_many :currencies
end
