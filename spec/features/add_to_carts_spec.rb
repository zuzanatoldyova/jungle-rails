require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product to the cart" do
    visit root_path
    find('article.product', match: :first).click_link('Add')
    sleep 5
    save_screenshot
    expect(find_link('My Cart').text).to include("My Cart (1)")
  end

end
