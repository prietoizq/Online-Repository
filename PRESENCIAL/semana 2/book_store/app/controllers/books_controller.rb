class BooksController < ApplicationController
	def index 
		@books = Book.last_created_books(20)
	end

	def show
		begin
			@book = Book.find params[:id]
		rescue ActiveRecord::RecordNotFound
			render 'no_found'
		end
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new book_params 
		if @book.save #si es valido, este .save devuelve true, y se guarda. Y si es false, no lo guarda. Con el save comprueba las validaciones que le pusimos en el modelo del project
			flash[:notice] = "Libro añadido satisfactoriamente"
			redirect_to books_path #si es true, lo guarda y te lleva al show del proyecto
		else
			flash[:alert] = "El libro no se ha añadido correctamente!"
			render 'new' 
		end
	end

	def edit
		@book = Book.find params[:id]
	end

	def update
		@book = Book.find params[:id]
		if @book.update book_params
			redirect_to @book 
		else
			render 'edit'
		end
	end

	def destroy
		book = Book.find params[:id] #aqui no hace falta poner @ ya que no necesitamos que ese project sea accesible en la VISTA
		book.destroy
		redirect_to books_path
	end

	private #este private hace que los metodos aqui dentro solo sean accesibles desde esta clase
	def book_params #este metodo SE PUEDE LLAMAR COMO QUIERAS, pero es necesario para que al crear un objeto se autorice su creacion (porque si no nos podrían meter codigo malicioso)
		params.require(:book).permit(:name, :description, :price, :mark)
	end
end
