class Order < ApplicationRecord
  has_many :carted_products
  belongs_to :user
  def calculated_subtotal
    quantity * Product.find_by(id: product_id).price
  end

  def calculated_tax
    subtotal * 0.09
  end

  def calculated_total
    subtotal + tax
  end

end
