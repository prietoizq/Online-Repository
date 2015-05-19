class Product < ActiveRecord::Base
	has_many :bids
	validates :name, :description, :date_limit, :user, :price, presence: true
	validates :user, format: { with: /\w+@\w*/ }

	def item_sold?
		if self.date_limit < Date.today
			max_offer = 0
			user_offer = ""
			self.bids.each do |bid|
				if bid.offer > max_offer
					max_offer = bid.offer
					user_offer = bid.user_offer
				end
			end
			self.price = max_offer
			self.user = user_offer
			return true
		else
			return false
		end
	end

	def out_of_date?
		if self.date_limit < Date.today
			return true
		else
			return false
		end
	end
end
