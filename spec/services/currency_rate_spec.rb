require 'rails_helper'

describe Services::CurrencyRate do
  let(:rub)         { create(:currency) }
  let(:dollar)      { create(:currency, :dollar) }
  let!(:pair)  { create(:currency_pair, base: dollar, quote: rub, price: 0) }

  subject { Services::CurrencyRate.new }

  it 'update price for currency pairs' do
    subject.call
    pair.reload

    expect(pair.price).to be_positive
  end
end
