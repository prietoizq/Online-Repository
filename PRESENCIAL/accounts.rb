class Account

	attr_accessor :website, :user, :password

	def initialize website, user, password
		@user = user
		@password = password
		@website = website
		encrypt_password
	end

	def encrypt_password
		new_password = []

		@password.each_byte do |c|
			if(c < 91 && c > 87) || (c < 123 && c > 119)
				new_password << (c - 23)
			else
				new_password << (c + 3)
			end
		end

		@password = ""

		new_password.each do |char|
			@password << char.chr
		end
	end

	def decrypt_password
		new_password = []

		@password.each_byte do |c|
			if(c < 68 && c > 64) || (c < 100 && c > 96)
				new_password << (c + 23)
			else
				new_password << (c - 3)
			end
		end

		@password = ""

		new_password.each do |char|
			@password << char.chr
		end
	end

end

ac = Account.new("www.facebook.com", "max_power", "asdf")

puts ac.password
ac.decrypt_password
puts ac.password
