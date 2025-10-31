# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data (optional for development)
OrderItem.destroy_all
Order.destroy_all
Product.destroy_all
Category.destroy_all
Address.destroy_all
User.destroy_all

puts "Creating users..."

# Create Sellers
seller1 = User.create!(
  first_name: "Alice",
  last_name: "Smith",
  email: "alice@example.com",
  password: "password",
  role: "seller"
)

seller2 = User.create!(
  first_name: "Bob",
  last_name: "Johnson",
  email: "bob@example.com",
  password: "password",
  role: "seller"
)

# Create Buyers
buyer1 = User.create!(
  first_name: "Charlie",
  last_name: "Brown",
  email: "charlie@example.com",
  password: "password",
  role: "buyer"
)

buyer2 = User.create!(
  first_name: "Diana",
  last_name: "Lee",
  email: "diana@example.com",
  password: "password",
  role: "buyer"
)

puts "Creating categories..."
categories = ["Onesies", "Pants", "Dresses", "Shirts", "Jackets"].map do |name|
  Category.create!(name: name)
end

puts "Creating addresses..."
Address.create!(
  user: buyer1,
  street: "123 Maple St",
  city: "Montreal",
  province: "QC",
  postal_code: "H1A2B3",
  country: "Canada",
  address_type: "shipping"
)

Address.create!(
  user: buyer2,
  street: "456 Oak Ave",
  city: "Montreal",
  province: "QC",
  postal_code: "H2B3C4",
  country: "Canada",
  address_type: "shipping"
)

puts "Creating products..."

products = [
  {
    title: "Blue Onesie",
    description: "Soft cotton onesie for newborns",
    size: "0-3 months",
    brand: "Carter's",
    condition: "like new",
    price: 15.0,
    category: categories[0],
    user: seller1,
    status: "available",
    location: "Montreal"
  },
  {
    title: "Pink Dress",
    description: "Cute pink dress for babies",
    size: "3-6 months",
    brand: "H&M",
    condition: "gently used",
    price: 20.0,
    category: categories[2],
    user: seller2,
    status: "available",
    location: "Montreal"
  },
  {
    title: "Green Pants",
    description: "Comfortable baby pants",
    size: "6-9 months",
    brand: "Gap",
    condition: "like new",
    price: 12.0,
    category: categories[1],
    user: seller1,
    status: "available",
    location: "Montreal"
  }
]

products.each do |p|
  product = Product.create!(p)
  # Optional: attach images if using ActiveStorage
  # product.images.attach(io: File.open("path/to/image.jpg"), filename: "image.jpg")
end

puts "Seeding completed!"
