$prizes = {apple:10, oranges:5, grapes:15, banana:20, watermelon:50}

class ShoppingCart
	def initialize
		@list=[]
	end

	def add (fruit)
		@list.push(fruit)
	end

	def show
		n=1
		@list.each do |object|
			puts "#{n} #{object} #{$prizes[object]}$"
			n+=1
		end
	end

	def cost
		v=0
		@list.each do |value|
			v += $prizes[value]
		end
		puts "Total cost: #{v}"
	end

end

cart = ShoppingCart.new

cart.add :apple
cart.add :banana
cart.add :banana
cart.add :grapes

cart.show

cart.cost