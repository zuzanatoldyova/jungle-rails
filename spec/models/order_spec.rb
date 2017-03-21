require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do

    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.create(name: "kitchen")
      @product1 = @category.products.create!(name: "chair", price_cents: 150, quantity: 30)
      @product2 = @category.products.create!(name: "table", price_cents: 250, quantity: 10)
      # Setup at least one product that will NOT be in the order
      @product3 = @category.products.create!(name: "teapot", price_cents: 50, quantity: 5)
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email: "zuzana@gmail.com", total_cents: 4000, stripe_charge_id: "someid")
      # 2. build line items on @order
      @order.line_items.new(product: @product1, quantity: 1, item_price: @product1.price_cents, total_price: @product1.price_cents)
      @order.line_items.new(product: @product2, quantity: 1, item_price: @product2.price_cents, total_price: @product2.price_cents)
    end

    it 'deducts quantity from products based on their line item quantities' do
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
     expect(@product1.quantity).to eq(29)
    end

    it 'does not deduct quantity from products that are not in the order' do
      @product3.reload
      expect(@product3.quantity).to eq(5)
    end

  end
end
