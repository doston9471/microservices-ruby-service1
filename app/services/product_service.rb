class ProductService
  def self.fetch_products
    conn = Faraday.new(url: 'http://localhost:3001') do |f|
      f.request :json
      f.response :json
    end

    response = conn.get('/api/v1/products')
    response.body
  rescue Faraday::Error => e
    { error: "Service unavailable: #{e.message}" }
  end
end