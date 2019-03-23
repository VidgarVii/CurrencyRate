class CurrencyRateChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from 'publish_course'
  end

  def unsubscribed
    stop_all_streams
  end
end
