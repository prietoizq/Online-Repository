class Bid < ActiveRecord::Base
	belongs_to :product
	validates :offer, :user_offer, presence: true
	validates :user_offer, format: { with: /\w+@\w*/ }
end
