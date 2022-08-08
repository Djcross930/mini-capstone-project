class Order < ApplicationRecord

  def subtotal
    quantity * Product.find_by(id: product_id).price
  end

  def tax
    subtotal * 0.09
  end

  def total
    subtotal + tax
  end

end
