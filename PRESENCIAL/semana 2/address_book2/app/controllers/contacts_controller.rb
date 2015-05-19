class ContactsController < ApplicationController
	def index
		@contacts = Contact.order(name: :asc)
	end

	def new
		@contact = Contact.new
	end

	def show
		@contact = Contact.find params[:id]
	end

	def create
		@contact = Contact.new contact_params #aquí se llama al metodo privado project_params (mas abajo)
		if @contact.save #si es valido, este .save devuelve true, y se guarda. Y si es false, no lo guarda. Con el save comprueba las validaciones que le pusimos en el modelo del project
			redirect_to @contact #si es true, lo guarda y te lleva al show del proyecto
		else
			render 'new' #si es falso, te vuelve a llevar a la vista de projects. Ahora se usa render, porque con el redirect_to, te machaca el proyecto
		end
	end

	private #este private hace que los metodos aqui dentro solo sean accesibles desde esta clase
	def contact_params #este metodo SE PUEDE LLAMAR COMO QUIERAS, pero es necesario para que al crear un objeto se autorice su creacion (porque si no nos podrían meter codigo malicioso)
		params.require(:contact).permit(:name, :address)
	end


end
