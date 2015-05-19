def PalindromeTwo(str)
	str = (palindromo?(sinSimbolos(str)))
  return str 
end

#para este ejercicio habría que usar una expresion regular para detectar si hay letras (www.rubular.com)

def sinSimbolos(string)
	cadena = ""
	string.downcase!
	alfabeto = ('a'..'z').to_a
	string.each_char do |letra|
		for n in (0..alfabeto.size)
			if alfabeto[n] == letra
				cadena << letra
			end
		end
	end
	return cadena
end


def palindromo?(string)
	string1 = string
	string2 = string.reverse
	if string1 === string2
		return true
	else
		return false
	end
end

puts PalindromeTwo("Noel - sees Leon")  == true
puts PalindromeTwo("A war at Tarawa!")  == true