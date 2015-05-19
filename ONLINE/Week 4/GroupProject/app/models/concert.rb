class Concert < ActiveRecord::Base
	validates :name, :venue, :city, :date, :price, :description, presence: true
end
