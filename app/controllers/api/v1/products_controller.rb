module Api::V1
  class ProductsController < ApplicationController
    def index
      products = ProductService.fetch_products
      render json: products
    end
  end
end
