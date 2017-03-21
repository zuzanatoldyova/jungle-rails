class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :decrease_products_quantity


  def decrease_products_quantity
    @items = self.line_items
    @items.each do |item|
      if item.product.quantity > 0
        new_quantity = item.product.quantity - item.quantity
        item.product.update(quantity: new_quantity)
      else
        throw(:abort)
      end
    end
  end

end
