class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    if @product.save
      render template: "products/show"
    else
      render json: @product.errors.full_messages, status: 412
    end
  end

  def update
    @product = Product.find_by(id: params[:id]) 
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    if @product.save
      render template: "products/show"
    else
      render json: @product.errors.full_messages, status: 412
    end

  end
  
  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "Product has been destroyed"}
  end

end
