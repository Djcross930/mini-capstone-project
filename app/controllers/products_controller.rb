class ProductsController < ApplicationController
  
  def all_products
    render json: {
      products: Product.all
  }
  end

  def show
    render json: {
      product: Product.find_by(id: params[:id])
    }
  end

end
