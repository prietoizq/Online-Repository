class BidsController < ApplicationController
	def new
		@product = Product.find params[:product_id]
		@bid = @product.bids.new
	end

	def create
		@product = Product.find params[:product_id]
		@bid = @product.bids.new bid_params
		@bid.date = Date.today
		if @bid.save
			flash[:notice] = "HAS PUJADO CORRECTAMENTE!!!"
			redirect_to product_path(@product)
		else
			flash[:alert] = "PUJA ERRÓNEA"
			render 'new'
		end
	end

	private
	def bid_params
		params.require(:bid).permit(:offer, :user_offer)
	end

end
