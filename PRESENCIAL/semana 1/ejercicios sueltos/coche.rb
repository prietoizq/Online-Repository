class Car

	@@number_of_cars = 0

	def initialize noise
		@noise = noise
		@@number_of_cars += 1
	end

	def make_noise
		puts @noise
	end

	def self.show_total_cars
		puts @@number_of_cars
	end

	def self.get_total_cars
		@@number_of_cars
	end

end

my_car = Car.new "Broooommm"
my_car.make_noise
my_new_car = Car.new "Fiummmmmm"
my_new_ferrary = Car.new "........."

Car.show_total_cars


