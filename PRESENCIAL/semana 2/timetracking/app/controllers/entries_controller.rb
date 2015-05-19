class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id] #el corchete con params tiene que ir junto!!
		@entries = @project.entries
	end

	def new
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end

	def create
		@project = Project.find params[:project_id]
		@entry = @project.entries.new entry_params

		if @entry.save
			flash[:notice] = "Entry created successfully"
			redirect_to project_path(@project) #le pasamos el @project para que tenga una forma de ver el parámetro project_id sobre el que tiene que coger las entries
		else
			flash[:alert] = "Entry hasn't been created!"
			render 'new'
		end
	end

	def edit
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
	end

	def update
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]

		if @entry.update entry_params
			flash[:notice] = "Entry updated successfully"
			redirect_to project_path(@project)
		else
			flash.now[:errors] = @entry.errors.full_messages #flash.now es para que el render no se lo coma y así poder usar el flash con el render
			render 'edit'
		end
	end

	def destroy
		@project = Project.find params[:project_id]
		entry = @project.entries.find params[:id]
		entry.destroy
		redirect_to project_path(@project)
	end

	private
	def entry_params
		params.require(:entry).permit(:hours, :minutes, :comments, :date)
	end
end
