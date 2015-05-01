class ConcertsController < ApplicationController
	def index
		@concerts = Concert.all
	end

	def show
		@concerts = Concert.find(params[:id])
	end

	def new
   	@concerts = Concert.new
  	end

  def edit
    @concert = Concert.find(params[:id])
  end

  def create
    @concerts = Concert.new(concert_params)
    if @concerts.save
    redirect_to concerts_path(@concerts)
    else
    render :new
    end
  
  end

  def update
    @concerts = Concert.find(params[:id])
    @concerts.update(concert_params)
    redirect_to concert_path(@concert)
  end

  def destroy
    @concerts = Concert.find(params[:id])
    @concerts.destroy

    redirect_to root_path
  end

  private
     	def concert_params
          params.require(:concert).permit(:name, :venue, :city, :date, :price, :description)
     	end
end
