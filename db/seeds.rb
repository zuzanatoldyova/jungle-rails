# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
# unless Rails.env.development?
#   puts "Development seeds only (for now)!"
#   exit 0
# end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 0,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 0,
  price: 2_483.75
})

puts "Finding products"

prod1 = Product.find(1)
prod2 = Product.find(2)
prod3 = Product.find(3)
prod4 = Product.find(4)
prod5 = Product.find(5)
prod6 = Product.find(6)
prod7 = Product.find(7)
prod8 = Product.find(8)
prod9 = Product.find(9)
prod10 = Product.find(10)

puts "Create users"
user1 = User.create({
  first_name: "Zuzana",
  last_name: "Toldyova",
  email: "zuzana@gmail.com",
  password_digest: BCrypt::Password.create('1234')
})

user2 = User.create({
  first_name: "Zuzi",
  last_name: "Toldy",
  email: "zuzi@gmail.com",
  password_digest: BCrypt::Password.create('5678')
})

puts "Create reviews"
prod1.user2.reviews.create!({
  description: "Really bad product",
  rating: 1
})

prod1.reviews.create!({
  user_id: user1.id,
  description: "Super comfy",
  rating: 4
})

prod2.reviews.create!({
  user_id: user1.id,
  description: "Fantastic",
  rating: 5
})

prod2.reviews.create!({
  user_id: user1.id,
  description: "I don't like it",
  rating: 2
})

prod3.reviews.create!({
  user_id: user2.id,
  description: "Best product",
  rating: 4
})

prod4.reviews.create!({
  user_id: user2.id,
  description: "Love it!",
  rating: 4
})

prod6.reviews.create!({
  user_id: user2.id,
  description: "Love it!",
  rating: 4
})

prod6.reviews.create!({
  user_id: user2.id,
  description: "Love it!",
  rating: 4
})

prod6.reviews.create!({
  user_id: user1.id,
  description: "Love it!",
  rating: 4
})

puts "DONE!"
