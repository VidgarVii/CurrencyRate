class Services::CurrencyRate
  def call(pairs)
    client.exchange(pairs)
  end

  def usdrub
    res = client.exchange('USDRUB')
    res.first['price'].round(2)
  end

  private

  def client
    ForexClient.new
  end
end
