class ForexClient
  ROOT_ENDPOINT = "https://forex.1forge.com/"

  def initialize
    @http_client = Faraday.new(url: ROOT_ENDPOINT)
    @api_key     = Rails.application.credentials.dig(:forex_api, :key)
  end

  def exchange(pairs)
    response = get_rate(pairs)
    JSON.parse(response.body)
  end

  private

  def get_rate(pairs)
    @http_client.get do |request|
      request.url '/1.0.3/quotes'
      request.params['pairs']   = pairs
      request.params['api_key'] = @api_key
    end
  end
end
