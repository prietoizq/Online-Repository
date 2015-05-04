def fizzbuzz()

	for n in (1..100)
		if divisible?(n, 3) && divisible?(n, 5) 
			puts "FizzBuzz"
		elsif divisible?(n, 3)
			puts "Fizz"
		elsif divisible?(n, 5)
			puts "Buzz"
		else
			puts n
		end
	end
end

def divisible? (a, b)
	a % b === 0
end

fizzbuzz()