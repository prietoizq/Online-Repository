class Review < ActiveRecord::Base
	belongs_to :book
	validates :book_id, :user, :rating, :comment, presence:true
end
