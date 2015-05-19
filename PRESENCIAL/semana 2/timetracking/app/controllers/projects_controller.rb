class ProjectsController < ApplicationController
	def index 
		@projects = Project.last_created_projects(10)
	end

	def show
		begin
			@project = Project.find params[:id]
		rescue ActiveRecord::RecordNotFound
			render 'no_projects_found', layout: 'admin'
		end
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new project_params #aquí se llama al metodo privado project_params (mas abajo)
		if @project.save #si es valido, este .save devuelve true, y se guarda. Y si es false, no lo guarda. Con el save comprueba las validaciones que le pusimos en el modelo del project
			flash[:notice] = "Project created successfully"
			redirect_to projects_path #si es true, lo guarda y te lleva al show del proyecto
		else
			flash[:alert] = "Project hasn't been created!"
			render 'new' #si es falso, te vuelve a llevar a la vista de projects. Ahora se usa render, porque con el redirect_to, te machaca el proyecto
		end
	end

	def edit
		@project = Project.find params[:id]
	end

	def update
		@project = Project.find params[:id]
		if @project.update project_params
			redirect_to @project #@project equivale a poner todo el path del show project
		else
			render 'edit'
		end
	end

	def destroy
		project = Project.find params[:id] #aqui no hace falta poner @ ya que no necesitamos que ese project sea accesible en la VISTA
		project.destroy
		redirect_to projects_path
	end

	private #este private hace que los metodos aqui dentro solo sean accesibles desde esta clase
	def project_params #este metodo SE PUEDE LLAMAR COMO QUIERAS, pero es necesario para que al crear un objeto se autorice su creacion (porque si no nos podrían meter codigo malicioso)
		params.require(:project).permit(:name, :description)
	end
end
