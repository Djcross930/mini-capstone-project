class OrdersController < ApplicationController
  before_action :authenticate_user


  def create
    if current_user
      order = Order.new
      order.user_id = current_user.id
      order.product_id = params[:product_id]
      order.quantity = params[:quantity]
      order.subtotal = order.calculated_subtotal
      order.tax = order.calculated_tax
      order.total = order.calculated_total
      order.save
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
