def NumberEncoding(str)

alfabeto = ('a'..'z').to_a
cadena = ""

	str.each_char do |x|
		encontrado = false
		
		
		for n in (0..alfabeto.size)
			if (alfabeto[n] === x)
				cadena << "#{n+1}"
				encontrado = true
			end
		end	
			

		if encontrado === false	
			cadena << "#{x}"
		end
			

	end

  puts(cadena)

  str = cadena
  return str 

end


NumberEncoding("hello 45")  == "85121215 45"
NumberEncoding("jaj-a")  == "10110-1"