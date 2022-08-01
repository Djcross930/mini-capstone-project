class Product < ApplicationRecord
  
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def is_discoounted?
    if price > 10
      false
    else
      true
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end




end
