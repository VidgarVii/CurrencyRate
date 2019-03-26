# Update CurrencyPair to DB

class Services::ParserCurrencyPair
  def run
    CurrencyPair.delete_all
    p found_pairs
    # found_pairs.each do |pair|
    #   p pair
    #   base  = Currency.find_by(code: pair[:base])
    #   quote = Currency.find_by(code: pair[:quote])
    #
    #   CurrencyPair.create(base: base, qoute: quote, price: pair[:price])
    # end
  end

  private

  # => [{base: 'USD', quote: 'RUB', price: 100}, ...]
  def found_pairs
    @pairs = []
    currency_pair = {}

    currency_code.each do |code|
      current_pairs_for(code).reduce do |pair|
        code_neighbor = neighbor(pair, code)
        p code_neighbor
        return unless neighbor_exists?(code_neighbor)

        currency_pair[:base]  = base?(code, pair) ? code : code_neighbor
        currency_pair[:quote] = base?(code_neighbor, pair) ? code_neighbor : code
        currency_pair[:price] = get_price(pair)

        @pairs << currency_pair
      end
    end

    @pairs
  end

  def get_price(pair)
    response.detect { |k| k['symbol'] == pair.join }['price'].round(2)
  end

  def base?(currency_code, pair)
    pair.index(currency_code).zero?
  end

  def neighbor(pair, current_code)
    pair.find { |x| x != current_code }
  end

  def neighbor_exists?(neighbor)
    Currency.exists?(code: neighbor)
  end

  # => [["EUR", "RUB"], ["USD", "RUB"] ...]
  def current_pairs_for(code)
    currency_pairs.select { |pair| pair.include?(code) }.map { |x| x.scan(/.{3}/) }
  end

  def currency_code
    Currency.pluck(:code)
  end

  def response
    @response ||= ForexClient.new.exchange
  end

  # => ["GBPNZD", "AUDCAD", "AUDCHF" ...] not exists on DB
  def currency_pairs
    response.collect { |currency| currency['symbol'] }
  end
end
