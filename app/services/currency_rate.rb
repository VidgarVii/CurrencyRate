class Services::CurrencyRate
  def initialize
    @currency_pairs ||= CurrencyPair.all
    @response = []
  end

  def call
    @response = client.exchange(make_array_pairs)
    update_pairs
  end

  private

  def get_price(pair)
    price = nil
    @response.each do |hash|
      price = hash['price'] if hash['symbol'] == pair
    end

    price.round(2)
  end

  def update_pairs
    @currency_pairs.each do |object|
      object.update(price: get_price(object.pair)) if object.date_force.nil?
    end
  end

  def make_array_pairs
    @currency_pairs.pluck(:pair)
  end

  def client
    ForexClient.new
  end
end
