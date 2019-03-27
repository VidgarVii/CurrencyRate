# Update CurrencyPair to DB

class Services::ParserCurrencyPair
  def run
    destroy_invalid_pairs_on_db

    make_found_pairs.each do |pair|
      CurrencyPair.create!(base: get_base(pair), quote: get_quote(pair), price: pair[:price])
    end
  end

  private

  def get_quote(pair)
    Currency.find_by(code: pair[:quote])
  end

  def get_base(pair)
    Currency.find_by(code: pair[:base])
  end

  # => [{base: 'USD', quote: 'RUB', price: 100}, ...]
  def make_found_pairs
    pairs = []
    currency_pair = {}

    valid_response_pairs.each do |pair|
      currency_pair[:base] = pair.first
      currency_pair[:quote] = pair.last
      currency_pair[:price] = get_price(pair)

      pairs << currency_pair
    end

    pairs
  end

  def destroy_invalid_pairs_on_db
    codes = CurrencyPair.pluck(:pair) - make_currency_pairs
    CurrencyPair.where(pair: codes).delete_all
  end

  def get_price(pair)
    response.detect { |k| k['symbol'] == pair.join }['price'].round(2)
  end

  def currency_codes
    @currency_codes ||= Currency.pluck(:code)
  end

  def response
    @response ||= ForexClient.new.exchange
  end

  def make_currency_pairs
    response.collect { |currency| currency['symbol'] }
  end

  # Extract invalid pairs on response

  # => ["GBPNZD", "AUDCAD", "AUDCHF" ...] not exists on DB
  def response_currency_pairs
    make_currency_pairs - CurrencyPair.pluck(:pair)
  end

  # => [["EUR", "RUB"], ["USD", "RUB"], ...]
  def response_current_pairs_for
    response_currency_pairs.map { |x| x.scan(/.{3}/) }
  end

  # [["EUR", "RUB"], ["USD", "RUB"], ...] select include currency_codes
  def valid_response_pairs
    response_current_pairs_for.select do |pair|
      (pair - currency_codes).size.zero?
    end
  end
end
