class Product < ApplicationRecord
  has_many :images
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than_or_equal_to: 0}
  validates :description, length: { in: 10...500 }


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

  def supplier
    Supplier.find_by(id: supplier_id)
  end
  
end
