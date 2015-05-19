# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Contact.create name: 'Angel', address: 'Mi calle particular', phone: "670966564, 650483729", email:'prietoizq@gmail.com'

50.times do |name, address, phone, email|
	name = (0..8).map{('A'..'Z').to_a[rand(26)]}.join
	address = "#{(0..4).map{('A'..'Z').to_a[rand(26)]}.join} #{(0..2).map{('A'..'Z').to_a[rand(26)]}.join} #{(0..12).map{('A'..'Z').to_a[rand(26)]}.join}"
	phone = (0..9).map{[rand(9)]}.join
	email = "#{(0..6).map{('A'..'Z').to_a[rand(26)]}.join}@gmail.com"

	Contact.create name: name, address: address, phone: phone, email: email

end




