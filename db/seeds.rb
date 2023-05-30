# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Starship.destroy_all

Starship.create!(name: "Millenium Falcon", model: "T-34", manufacturer: "Corellia", hyperdrive_rating: 2, price: 180000, max_speed: 200, passangers: 1, length: 10, location: "Corellia", user_id: 1)
Starship.create!(name: "Desol", model: "T-34", manufacturer: "Corellia", hyperdrive_rating: 2, price: 180000, max_speed: 200, passangers: 1, length: 10, location: "Corellia", user_id: 1)

Starship.create(
  name: "etoile rouge", model: "oui", starship_class: "t2", manufacturer: "ford", length: "55",
  passangers: "3", max_speed: "8", hyperdrive_rating: "4", price: "5", location: "tatouin", user_id: "1"
)
# Booking.create(start_month: "4", status: true)
