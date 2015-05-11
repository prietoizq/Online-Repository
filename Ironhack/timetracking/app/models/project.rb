class Project < ActiveRecord::Base

	def self.iron_find param
		n = Project.where("id=?", param)
		return n[0]
	end

end
