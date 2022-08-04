class SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: suppliers.as_json
  end

  def show
    supplier = Supplier.find_by(id: params[:id])
    render json: supplier.as_json  
  end

  def create
    supplier = Supplier.new
    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.phone_number = params[:phone_number]
    supplier.save
    render json: supplier.as_json  
  end


end
