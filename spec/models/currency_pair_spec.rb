require 'rails_helper'

RSpec.describe CurrencyPair, type: :model do
  it { should belong_to :quote }
  it { should belong_to :base }
  it { should validate_presence_of :price }
end
