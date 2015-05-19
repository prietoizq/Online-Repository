# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Laptop.create( name: "Laptop 1", brand: "Toshiba", model: "Satellite 15.6", processor: "Intel Celeron", ram: 4, price: 229.99)
Laptop.create( name: "Laptop 2", brand: "HP", model: "Touch-Screen Laptop", processor: "Intel Core i3", ram: 6, price: 399.99)
Laptop.create( name: "Laptop 3", brand: "Apple", model: "MacBook Air", processor: "Intel Core i5", ram: 4, price: 949.99)
Laptop.create( name: "Laptop 4", brand: "Lenovo", model: "15.6 Laptop", processor: "AMD A8", ram: 6, price: 329.99)

Backpack.create( name: "Backpack 1", color: "Red", capacity: 12, pockets: 8, waterproof: true )
Backpack.create( name: "Backpack 2", color: "Blue", capacity: 10, pockets: 6, waterproof: true )
Backpack.create( name: "Backpack 3", color: "Yellow", capacity: 14, pockets: 10, waterproof: false )
Backpack.create( name: "Backpack 4", color: "Red", capacity: 8, pockets: 5, waterproof: false )