class Services::CurrencyRate

  def call
    @response = client.exchange(make_array_pairs)
    update_pairs
    publish_course
  end

  private

  def get_price(pair)
    @response.find { |hash| hash['symbol'] == pair }['price'].round(2)
  end

  def update_pairs
    CurrencyPair.all.each do |object|
      return unless object.date_force.nil?

      object.update(price: get_price(object.pair))
    end
  end

  def publish_course
    hash_pairs = CurrencyPair.pluck(:id, :price).to_h

    ActionCable.server.broadcast(
        'publish_course',
        { pairs: hash_pairs }
    )
  end

  def make_array_pairs
    CurrencyPair.pluck(:pair)
  end

  def client
    ForexClient.new
  end
end
