# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = {name: "Dishoom", address:" 7 Boundary St, London E2 7JE", phone_number: "55 123 4567", category: "chinese"}
pizza_east = {name: "Pizza East", address:" 56A Shoreditch High St, London E1 6PQ", phone_number: "89 234 5678", category: "italian" }
sakura_sushi = {name: "Sakura Sushi", address:" 123 Main St, Anytown, USA", phone_number: "456 789 1234", category: "japanese" }
bistro = {name: "Le Petit Bistro", address:" 789 Rue de la Paix, Paris, France", phone_number: "175 980 5678", category: "french" }
brasserie = { name: "Belga Brasserie", address:" 456 Grand Place, Brussels, Belgium", phone_number: "578 901 2345", category: "belgian" }

[dishoom, pizza_east, sakura_sushi, bistro, brasserie].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
