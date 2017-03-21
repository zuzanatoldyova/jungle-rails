require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.create(name: "antiques")
      @product = @category.products.create(name: "chair", price_cents: 15, quantity: 20)
    end

    it "saves successfully" do
      expect(@product).to be_valid
    end

    it "doesn't validate a product without name" do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "doesn't validate a product without price" do
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors.size).to be >= 1
    end

    it "doesn't validate a product without quantity" do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors.size).to be >= 1
    end

    it "doesn't validate a product without a category" do
      @product.category = nil
      @product.valid?
      expect(@product.errors.size).to eq(1)
    end

  end
end