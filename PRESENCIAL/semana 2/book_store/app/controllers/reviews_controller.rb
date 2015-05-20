class ReviewsController < ApplicationController
	def index
		@book = Book.find params[:book_id] #el corchete con params tiene que ir junto!!
		@entries = @book.entries
	end

	def new
		@book = Book.find params[:book_id]
		@review = @book.reviews.new
	end

	def create
		@book = Book.find params[:book_id]
		@review = @book.reviews.new review_params

		if @review.save
			flash[:notice] = "review created successfully"
			redirect_to book_path(@book) #le pasamos el @book para que tenga una forma de ver el parámetro book_id sobre el que tiene que coger las entries
		else
			flash[:alert] = "review hasn't been created!"
			render 'new'
		end
	end

	def edit
		@book = Book.find params[:book_id]
		@review = @book.reviews.find params[:id]
	end

	def update
		@book = Book.find params[:book_id]
		@review = @book.reviews.find params[:id]

		if @review.update review_params
			flash[:notice] = "review updated successfully"
			redirect_to book_path(@book)
		else
			flash.now[:errors] = @review.errors.full_messages #flash.now es para que el render no se lo coma y así poder usar el flash con el render
			render 'edit'
		end
	end

	def destroy
		@book = Book.find params[:book_id]
		review = @book.reviews.find params[:id]
		review.destroy
		redirect_to book_path(@book)
	end

	private
	def review_params
		params.require(:review).permit(:user, :rating, :comment)
	end
end
