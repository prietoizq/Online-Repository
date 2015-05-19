class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		begin
			@product = Product.find params[:id]
		rescue ActiveRecord::RecordNotFound
			render 'no__found'
		end
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new product_params
		if @product.save
			flash[:notice] = "HAS AÑADIDO TU PRODUCTO A LA SUBASTA"
			redirect_to products_path
		else
			flash[:alert] = "ERROR. TU PRODUCTO NO HA SIDO CREADO"
			render 'new'
		end
	end

	private
	def product_params
		params.require(:product).permit(:name, :description, :date_limit, :user, :price)
	end
end
