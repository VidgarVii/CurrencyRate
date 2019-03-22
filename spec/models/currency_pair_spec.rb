require 'rails_helper'

RSpec.describe CurrencyPair, type: :model do
  it { should belong_to :quote }
  it { should belong_to :base }
  it { should validate_presence_of :price }

  describe 'after create CurrencyPair mast make pair' do
    let(:rub) { create(:currency) }
    let(:dollar) { create(:currency, :dollar) }

    it '#make pair' do
      pair = CurrencyPair.create(base: dollar, quote: rub, price: 1)

      expect(pair.pair).to eq 'USDRUB'
    end
  end
end
