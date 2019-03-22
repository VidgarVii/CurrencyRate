require 'rails_helper'

describe ForexClient do
  subject { ForexClient.new }

  it 'initialize' do
    expect(subject).to be_is_a(ForexClient)
  end

  it 'get array from response' do
    expect(subject.exchange('USDRUB').first['symbol']).to eq 'USDRUB'
  end

  it 'get price with USDRUB' do
    expect(subject.exchange('USDRUB').first['price'].to_s).to match(/\d+/)
  end

  it 'response 2 object' do
    expect(subject.exchange('USDRUB', 'EURUSD').size).to eq 2
  end
end
