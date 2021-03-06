$prizes = {apples:10, oranges:5, grapes:15, bananas:20, watermelon:50}

class ShoppingCart
	def initialize
		@list=[]
		@n_apples=0
		@n_oranges=0
		@n_grapes=0
		@n_bananas=0
		@n_watermelon=0
	end

	def add (fruit)
		@list.push(fruit)
		case fruit
			when :apples
				@n_apples += 1
			when :oranges
				@n_oranges += 1
			when :grapes
				@n_grapes += 1
			when :bananas
				@n_bananas += 1
			when :watermelon
				@n_watermelon +=1
		end
	end

	def show
		a=false
		o=false
		g=false
		b=false
		w=false
		@list.each do |object|
			case object
			when :apples
				if a==false
					puts "#{@n_apples} #{object} #{$prizes[object]} $"
					a=true
				end
			when :oranges
				if o==false
					puts "#{@n_oranges} #{object} #{$prizes[object]} $"
					o=true
				end
			when :grapes
				if g==false
					puts "#{@n_grapes} #{object} #{$prizes[object]} $"
					g=true
				end
			when :bananas
				if b==false
					puts "#{@n_bananas} #{object} #{$prizes[object]} $"
					b=true
				end
			when :watermelon
				if w==false
					puts "#{@n_watermelon} #{object} #{$prizes[object]} $"
					w=true
				end
			end
		end
	end

	def cost
		v=0
		@list.each do |value|
			v += $prizes[value]
		end
		puts "\n Total cost: #{v} $"
	end

end

cart = ShoppingCart.new

cart.add :apples
cart.add :bananas
cart.add :bananas
cart.add :bananas
cart.add :grapes
cart.add :watermelon
cart.add :grapes

cart.show

cart.cost