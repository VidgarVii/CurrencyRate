class CurrencyPairsController < ApplicationController
  def index
    @pair = CurrencyPair.find_by(pair: 'USDRUB')
    @currencies = Currency.all
  end

  def find_pair
    if pair_itself?
      currency = Currency.find_by(code: params['currency_base'])
      @currency_pairs = CurrencyPair.new(pair: make_pair, quote: currency, base: currency, price: 1.0)
    else
      @currency_pairs = CurrencyPair.find_by(pair: make_pair)
    end

    render json: @currency_pairs, each_serializer: CurrencySerializer
  end

  private

  def make_pair
    params['currency_base'] + params['currency_quote']
  end

  def pair_itself?
    params['currency_base'] == params['currency_quote']
  end
end
