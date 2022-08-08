class OrdersController < ApplicationController

  def create
    if current_user
      order = Order.new
      order.user_id = current_user.id
      order.product_id = params[:product_id]
      order.quantity = params[:quantity]
      order.save
      render json: order
    else
      render json: {message: "can't do that bud"}
    end
  end

end
