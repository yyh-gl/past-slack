module Request
  require 'net/http'

  CACHE_EXPIRES = 1.weeks

  def send_request(method, params={})
    # TODO: エラーハンドリング（APIの方も変えないとだめ）
    # TODO: キャッシュが正常に動作しているか確認する
    Rails.cache.fetch("#{method}::#{Digest::SHA256.hexdigest(params.to_json)}", expires_in: CACHE_EXPIRES) do
      JSON.parse(Net::HTTP.get(create_uri(method, params)))
    end
  end

  private

  def create_uri(method, params)
    URI.parse([ENV['API_SERVER_URI'], method].join).tap do |uri|
      uri.query = URI.encode_www_form({}.merge(params))
    end
  end
end