# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
20.times do
  Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Fantasy::Tolkien.poem,
    img_url: 'https://picsum.photos/200/300.jpg',
    price: Faker::Commerce.price(range: 0..8.00, as_string: true),
  )
end
