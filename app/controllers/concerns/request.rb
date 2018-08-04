module Request
  require 'net/http'

  CACHE_EXPIRES = 5.seconds

  def send_request(method, params={})
    # TODO: エラーハンドリング（APIの方も変えないとだめ）
    Rails.cache.fetch("#{method}::#{Digest::SHA256.hexdigest(params.to_json)}", expires_in: CACHE_EXPIRES) do
      JSON.parse(Net::HTTP.get(create_uri(method, params)))
    end
  end

  private

  def create_uri(method, params)
    puts [ENV['API_SERVER_URI'], method].join
    URI.parse([ENV['API_SERVER_URI'], method].join).tap do |uri|
      uri.query = URI.encode_www_form(params)
    end
  end
end