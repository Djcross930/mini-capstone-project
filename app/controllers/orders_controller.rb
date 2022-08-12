class OrdersController < ApplicationController
  before_action :authenticate_user, only: [:show, :index, :update]


  def create
    if current_user
      order = Order.new
      order.user_id = current_user.id
      carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      subtotal = 0
      carted_products.each do |carted_product|
        if carted_product.status == "carted"
          subtotal = subtotal + (carted_product.product.price * carted_product.quantity)
          carted_product.status = "purchased"
          carted_product.save
        end  
      end
      order.subtotal = subtotal
      order.tax = (subtotal * 0.09)
      order.total = subtotal + (subtotal * 0.09)
      order.save!
      
      carted_products = CartedProduct.where(user_id: current_user.id, status: "purchased")
      
      carted_products.each do |carted_product|
        carted_product.order_id = order.id
        carted_product.save
      end

      render json: order.as_json
    else
      render json: {message: "can't do that bud"}
    end
  end

  def index
    if current_user
      orders = Order.where(user_id: current_user.id)
      render json: orders.as_json
    else
      render json: {message: "log in to continue"}
    end
  end
  
  def show
    if current_user
      order = Order.find_by(id: params[:id])
      render json: order.as_json
    else
      render json: {message: "log in to view"}
    end
  end



end
