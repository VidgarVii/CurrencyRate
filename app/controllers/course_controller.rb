class CourseController < ApplicationController
  def index
    @pair = CurrencyPair.find_by(base: dollar, quote: ruble)
  end

  private

  def dollar
    Currency.find_by(code: 'USD')
  end

  def ruble
    Currency.find_by(code: 'RUB')
  end

end
