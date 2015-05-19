require 'imdb'


class ImdbRating

	def initialize
		@films_array
		@films = {}
	end

	def get_film file
		file_contents = IO.read(file)
		@films_array = file_contents.split("\n")
	end

	def search_film
		
		@films_array.each do |x|
			film = Imdb::Search.new(x).movies[0]
			title = film.title
			rating = film.rating

			@films[title] = rating
		end
	end

	def paint_table
		puts ""
		array_line = ""
		marks = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
		marks.each do |number|
			string = ""
			@films.each_value do |rating|		
				if rating.to_i > number.to_i
					string = string + "|" + "#" + "|"
				else
					string = string + "|" + " " + "|"
				end
			end
			array_line = array_line + "---"
			puts string
		end
		puts array_line
	end

	def paint_numbers
		string = ""
		count = 1
		@films.each_key do |title|
			string = string + "|" + "#{count}" + "|"
			count += 1
		end
		puts ""
		puts string
		puts ""
	end

	def paint_list
		array = []
		count = 1
		@films.each_key do |title|
			array.push("#{count}. #{title}")
			count += 1
		end
		puts array
	end

end


imdb = ImdbRating.new 
imdb.get_film "movies.txt"
imdb.search_film
imdb.paint_table
imdb.paint_numbers
imdb.paint_list




