class ProductsController < ApplicationController
  
  def all_products
    render json: {
      products: Product.all
  }
  end

  def tv
    render json: {
      product: Product.find_by(name: "TV")
    }
  end

end
