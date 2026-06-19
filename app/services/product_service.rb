require "faraday"

class ProductService
  def self.fetch_products
    base_url = ENV.fetch("PRODUCTS_SERVICE_URL", "http://localhost:3001")

    conn = Faraday.new(
      url: base_url,
      headers: { "Content-Type" => "application/json" }
    )

    response = conn.get("/api/v1/products")
    JSON.parse(response.body)
  rescue Faraday::Error => e
    { error: "Products service unavailable: #{e.message}" }
  end
end
