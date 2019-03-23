class CurrencyRateJob < ApplicationJob
  queue_as :default

  def perform
    Services::CurrencyRate.new.call
  end
end
