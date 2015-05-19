require 'imdb'
require 'ascii_charts'

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
		array_table = []
		counter = 1
		@films.each do |key, value|
			item = [counter, value.round]
			counter += 1
			array_table << item
		end

		puts AsciiCharts::Cartesian.new(array_table, :bar => true, :hide_zero => true).draw
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
imdb.paint_list

