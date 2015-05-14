class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id] #el corchete con params tiene que ir junto!!
		@entries = @project.entries
	end
end
