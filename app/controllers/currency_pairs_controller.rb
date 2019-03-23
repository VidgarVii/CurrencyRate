class CurrencyPairsController < ApplicationController
  def index
    @pair = CurrencyPair.find_by(pair: 'USDRUB')
  end
end
