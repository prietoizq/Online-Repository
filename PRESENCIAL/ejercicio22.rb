def NumberEncoding(str)

alfabeto = ('a'..'z').to_a
cadena = ""

	str.each_char do |x|
		encontrado = false
		letra = alfabeto.index(x)
		if letra != -1
			cadena << "#{letra}"
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