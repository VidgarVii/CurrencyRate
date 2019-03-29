class CurrencyPairsController < ApplicationController
  def index
    @pair = CurrencyPair.find_by(pair: 'USDRUB')
    @currencies = Currency.all
  end

  def find_pair
    @currency = Currency.find(params[:id])
    @pairs = Currency.find(params[:id]).currency_pairs.as_json
  end
end
