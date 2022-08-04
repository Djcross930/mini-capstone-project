class ImagesController < ApplicationController
  def create
    image = Image.new
    image.url = params[:url]
    image.product_id = params[:product_id]
    image.save
    render json: image.as_json
  end

end
