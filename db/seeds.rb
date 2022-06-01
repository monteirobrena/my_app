# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Car.where(name: "Fit", model: "LX", license_plage: "XXX-000").first_or_create
Car.where(name: "HRV", model: "LX", license_plage: "XXX-000").first_or_create
Car.where(name: "WRV", model: "LX", license_plage: "XXX-000").first_or_create
Car.where(name: "City", model: "LX", license_plage: "XXX-000").first_or_create
Car.where(name: "Civic", model: "LX", license_plage: "XXX-000").first_or_create


