def DashInsertII(num)

	cadena = ""

	n1 = ""

  	num.each_char do |x|

  		n = x.to_i

	  	if (n % 2 === 0 && n != 0)
	  		n2 = "par"
	  	elsif (n % 2 != 0 && n != 0)
	  		n2 = "impar"
	  	end

	  	if (n2 === n1 && n2 === "par")
	  		cadena << "*"
	  	elsif (n2 === n1 && n2 === "impar")
	  		cadena << "-"
	  	end


	  	cadena << "#{n}"

	  	n1 = n2

	end

puts(cadena)

return num 


end

DashInsertII("99946")
DashInsertII("56647304")
