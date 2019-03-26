class ForexClient
  ROOT_ENDPOINT = "https://forex.1forge.com/".freeze
  API_KEY = Rails.application.credentials.dig(:forex_api, :key).freeze

  def exchange(*pairs)
    response = get_rate(make_pairs(*pairs))
    JSON.parse(response.body)
  end

  private

  def make_pairs(*pairs)
    pairs.join(',')
  end

  def get_rate(pairs)
    http_client.get do |request|
      request.url '/1.0.3/quotes'
      request.params['pairs']   = pairs
      request.params['api_key'] = API_KEY
    end
  end
end
