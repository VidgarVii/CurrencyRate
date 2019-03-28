require 'rails_helper'

describe Services::ParserCurrencyPair do
  let!(:rub)         { create(:currency) }
  let!(:dollar)      { create(:currency, :dollar) }

  subject { Services::ParserCurrencyPair.new }

  it '#run' do
    expect { subject.run }.to change(CurrencyPair, :count).by(2)
  end

  it 'Dont rewrite to DB' do
    subject.run

    expect { subject.run }.to_not change(CurrencyPair, :count)
  end
end
