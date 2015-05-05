
def fizzbuzz(first, last, rules)
	for n in(first..last)
		result = use_rule n, rules
			if result.empty?
				puts n
			else
				puts result
			end
	end
end

def use_rule number, rules2
	result=""
	rules2.each do |key, value|
		if divisible? number, value
			result << key.to_s
		end
	end
	result #Esta función devuelve result
end



def divisible?(a, b)
	a % b === 0
end


#def start()

=begin
puts "¿Quieres introducir una nueva regla (s/n)?"
	resp = gets.chomp.downcase
	if resp === 's'
		puts "Introduce el número cuyo múltiplo quieres que tenga una regla"
		number = gets.chomp.to_i
		puts "Introduce la palabra que quieres que se sustituya por el número"
		word = gets.chomp.to_sym
		hash = Hash.new 
		$rule[word] = number
		start()
	elsif resp === 'n'
		puts "****************************************"
	else puts "Por favor, introduce s(SI) o n(NO)"
		start()
	end
=end

#$rule = Hash.new
rule={fizz: 3,buzz: 5, ban: 8}
#start()
fizzbuzz(1, 30, rule)