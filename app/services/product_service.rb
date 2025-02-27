require "faraday"

class ProductService
  def self.fetch_products
    conn = Faraday.new(
      url: "http://localhost:3001",
      headers: {"Content-Type" => "application/json"}
    )

    response = conn.get("/api/v1/products")
    JSON.parse(response.body)
  rescue Faraday::Error => e
    { error: "Products service unavailable: #{e.message}" }
  end
end