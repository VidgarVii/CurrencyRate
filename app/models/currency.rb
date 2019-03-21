class Currency < ApplicationRecord
  validates :name, :sign, :code, presence: true,
                                 uniqueness: true
  validates :code, length: { is: 3 }

end
