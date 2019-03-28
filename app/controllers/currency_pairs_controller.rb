class CurrencyPairsController < ApplicationController
  def index
    # @pair = CurrencyPair.all
    @pair = CurrencyPair.find_by(pair: 'USDRUB')
  end
end
