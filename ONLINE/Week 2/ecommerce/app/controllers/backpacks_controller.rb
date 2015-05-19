class BackpacksController < ApplicationController
		def index
		@backpacks = Backpack.all
	end

	def show
        @backpack = Backpack.find(params[:id])
    end

    def new
  		@backpack = Backpack.new
  	end

	def edit
	  @backpack = Backpack.find(params[:id])
	end

  	def create
   		@backpack = Backpack.new(backpack_params)
    	@backpack.save
    	redirect_to backpack_path(@backpack)
  	end

	def update
	  @backpack = Backpack.find(params[:id])
	  @backpack.update(backpack_params)
	  redirect_to  backpack_path(@backpack)
	end

	def destroy
	  @backpack = Backpack.find(params[:id])
	  @backpack.destroy

	  redirect_to root_path
	end

  private
     def backpack_params
          params.require(:backpack).permit(:name, :color, :capacity, :pockets, :waterproof)
     end


end
