class Contact < ActiveRecord::Base
	has_many :emails
	has_many :phones

end
