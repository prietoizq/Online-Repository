class Project < ActiveRecord::Base

	has_many :entries
	validates :name, presence: true 
	validates :name, uniqueness: true
	validates :name, length: { maximum: 30 } 
	validates :name, format: { with: /[a-zA-Z\d\s]/ }

	def self.iron_find param  #Se le pone self para que sea un método de clase
		n = Project.where("id=?", param)
		return n[0]
	end

	def self.clean_all
		one_week_ago = Date.today - 1.week
		projects = Project.where("created_at < ?", one_week_ago)
		projects.destroy_all
	end

	def self.last_created_projects n
		Project.order(created_at: :desc).limit(n)
	end

	def total_hours_in_month month, year
		all_entries = self.entries #al poner esto, en all_entries tenemos TODAS LAS ENTRIES del proyecto con el que hayamos llamado a este metodo
		all_selected_entries = all_entries.select do |entry|
			entry.date.month == month && entry.date.year == year
		end

		hours = all_selected_entries.reduce(0){|sum, entry| sum + entry.hours}
		minutes = all_selected_entries.reduce(0){|sum, entry| sum + entry.minutes}

		total_hours = hours + (minutes/60)
	end
end
