class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: {products: products.as_json}
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: {message: product.as_json}
  end
end
