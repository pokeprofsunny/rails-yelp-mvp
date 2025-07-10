# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning up database..."
Restaurant.destroy_all
puts "Creating restaurants..."

restaurants = [
  {
    name: "Sakura",
    address: "1 Chome-1-1 Shibuya, Tokyo",
    phone_number: "03-1234-5678",
    category: "japanese"
  },
  {
    name: "La Bella",
    address: "Via Roma 42, Rome",
    phone_number: "06-4321-9876",
    category: "italian"
  },
  {
    name: "Chez Paul",
    address: "5 Rue de Paris, Paris",
    phone_number: "01-5544-7788",
    category: "french"
  },
  {
    name: "Great Wall",
    address: "88 Forbidden St, Beijing",
    phone_number: "010-9988-7766",
    category: "chinese"
  },
  {
    name: "Brussels Waffles",
    address: "2 Rue de Waffle, Brussels",
    phone_number: "02-3344-5566",
    category: "belgian"
  }
]

restaurants.each do |restaurant_data|
  Restaurant.create!(restaurant_data)
end

puts "Seeding complete! 🌱"
