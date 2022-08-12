class CartedProductsController < ApplicationController
  before_action :authenticate_user
  def create
    if current_user
      carted_product = CartedProduct.new
      carted_product.user_id = current_user.id 
      carted_product.product_id = params[:product_id]
      carted_product.quantity = params[:quantity]
      carted_product.status = "carted"
      carted_product.save!
      render json: carted_product.as_json
    end
  end

  def index
    if current_user
      carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      render json: carted_products.as_json
    end
  end

end
