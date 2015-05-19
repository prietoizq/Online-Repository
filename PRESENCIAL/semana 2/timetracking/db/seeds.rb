# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create name: "Ironhack", description: "Texto de prueba"


(1..20).each do |index|
	name = "Testing element "+index.to_s
	description = "Descripcion de prueba"
	Project.create name: name, description: description	
end

100.times do
	rand_project_id = (rand Project.count) +1
	p = Project.find rand_project_id
	p.entries.create date: Date.today, hours: rand(24), minutes: rand(60)
end

puts "Correctamente ejecutado"