class Book < ActiveRecord::Base
	has_many :reviews
	validates :name, :price, :description, presence: true

	def self.last_created_books n
		Book.order(created_at: :desc).limit(n)
	end

	def calculate_mark
		sum = self.reviews.inject{|sum,x| sum + x }
		sum/self.reviews.size
	end

end
