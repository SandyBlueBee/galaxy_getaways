# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Starship.create!(name: "Millenium Falcon", model: "T-34", manufacturer: "Corellia", hyperdrive_rating: 2, price: 180000, max_speed: 200, passangers: 1, length: 10, location: "Corellia", user_id: 1)
# Starship.create!(name: "Desol", model: "T-34", manufacturer: "Corellia", hyperdrive_rating: 2, price: 180000, max_speed: 200, passangers: 1, length: 10, location: "Corellia", user_id: 1)

# Starship.create(name:"etoile rouge", model:"oui", starship_class:"t2", manufacturer:"ford", length:"55", passangers:"3", max_speed:"8", hyperdrive_rating:"4", price:"5", location:"tatouin", user_id:"1")
# Booking.create(start_month:"4", status:true)

require "open-uri"

puts "creating admin user..."
User.destroy_all
user = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "azerty", password_confirmation: "azerty")

puts "parsing api..."
url = "https://swapi.dev/api/starships"
data = URI.open(url).read
starships = JSON.parse(data) #  hash

puts "creating starships..."
starships.dig('results').each_with_index do |hash, index|
  starship = Starship.new(name: hash["name"], model: hash["model"], manufacturer: hash["manufacturer"], length: hash["length"].to_f, hyperdrive_rating: hash["hyperdrive_rating"].to_f, price: hash["cost_in_credits"].to_i, max_atmosphering_speed: hash["max_atmosphering_speed"].to_i ||= rand(800..1100), passengers: hash["passengers"].to_i ||= rand(10..9999), location: "star wars", user_id: user.id)
  file = File.open("#{Rails.root}/db/photos_seed/photo_#{index + 1}.png")
  starship.photos.attach(io: file, filename: "photo_#{index + 1}.png")
  starship.save!
end

puts "Ready!"
# data = URI.open(starships['next']).read
# starships = JSON.parse(data) #  hash

# p starships

# starships.dig('results').each do |hash|
#   Starship.create!(name: hash["name"], model: hash["model"], manufacturer: hash["manufacturer"], length: hash["length"], hyperdrive_rating: hash["hyperdrive_rating"].to_i, price: hash["cost_in_credits"].to_i, max_speed: hash["max_speed"], passangers: hash["passangers"], location: "star wars", user_id: user.id)
# end

# data = URI.open(starships['next']).read
# starships = JSON.parse(data) #  hash

# p starships

# starships.dig('results').each do |hash|
#   Starship.create!(name: hash["name"], model: hash["model"], manufacturer: hash["manufacturer"], length: hash["length"], hyperdrive_rating: hash["hyperdrive_rating"].to_i, price: hash["cost_in_credits"].to_i, max_speed: hash["max_speed"], passangers: hash["passangers"], location: "star wars", user_id: user.id)
# end

# data = URI.open(starships['next']).read
# starships = JSON.parse(data) #  hash

# p starships

# starships.dig('results').each do |hash|
#   Starship.create!(name: hash["name"], model: hash["model"], manufacturer: hash["manufacturer"], length: hash["length"], hyperdrive_rating: hash["hyperdrive_rating"].to_i, price: hash["cost_in_credits"].to_i, max_speed: hash["max_speed"], passangers: hash["passangers"], location: "star wars", user_id: user.id)
# # end

# file = File.open("photos_seed/photo1.png")
# starship = Starship.last
# starship.photos.attach(io: file, filename: "photo1.png")
# starship.save
puts "Created starship"
