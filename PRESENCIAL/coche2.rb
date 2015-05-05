#Este archivo hace lo mismo que coche.rb pero en vez de usar la variable de clase almacenamos el dato en un fichero Cars.txt

class Car

	def initialize noise
		@noise = noise
		Car.update_number
	end

	def make_noise
		puts @noise
	end

	def self.read_number
		IO.read('cars.txt').to_i
	end

	def self.update_number
		IO.write('cars.txt', Car.read_number + 1)
	end

	def self.show_total_cars
		puts "Number of cars: #{Car.read_number}"
	end

	def self.get_total_cars
		Car.read_number
	end

end

class RacingCar < Car
	def initialize
		@noise = "BROOOOM"
		Car.update_number
	end
end

my_car = Car.new "Broooommm"
my_car.make_noise
my_new_car = Car.new "Fiummmmmm"
my_new_ferrary = Car.new "........."

my_racing_car = RacingCar.new
my_racing_car.make_noise

Car.show_total_cars