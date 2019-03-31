class CurrencyPairsController < ApplicationController
  def index
    @pair = CurrencyPair.find_by(pair: 'USDRUB')
    @currencies = Currency.all
  end

  def find_pair
    pair = params['currency_base'] + params['currency_quote']

    @currency_pairs = CurrencyPair.find_by(pair: pair)
    render json: @currency_pairs, each_serializer: CurrencySerializer
  end
end
