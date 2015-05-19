class Account

	attr_accessor :website, :user, :password, :encrypted

	def initialize website, user, password
		@user = user
		@password = password
		@website = website
		@encrypted = false
		@decrypted = false
		encrypt_password
	end

	def encrypt_password
		new_password = []

		if @encrypted === false
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

			@encrypted = true
			@decrypted = false

		else
			puts "Password already encrypted"
		end
	end

	def decrypt_password
		new_password = []

		if @decrypted === false
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

			@decrypted = true
			@encrypted = false

		else
			puts "Password already decrypted"
		end
	end

end


ac = Account.new("www.facebook.com", "max_power", "asdf")
ab = Account.new("www.twitter.com", "angel", "ironhack")
ad = Account.new("www.google.com", "angel_dos", "robbstark")
=begin
puts ac.password

ac.decrypt_password
puts ac.password

ac.decrypt_password
puts ac.password

ac.encrypt_password
puts ac.password

ac.encrypt_password
puts ac.password
=end

class AccountsManager

	attr_accessor :passwords_hash

	def initialize
		@passwords_hash = {}
		@secure_passwords_array = []
		@insecure_passwords_array = []
	end

	def add accounts
		@passwords_hash[accounts.user] = accounts.password

		if accounts.encrypted = true
			@secure_passwords_array.push accounts.user
		end

		if accounts.password.size < 5
			@insecure_passwords_array.push accounts.user
		end
	end

	def show_accounts
		puts "*********************************"
		puts "Cuentas con contraseña codificada:"
		puts @secure_passwords_array
		puts "*********************************"
	end

	def count_insecure_accounts
		puts "*********************************"
		puts "Cuentas con contraseña insegura:"
		puts @insecure_passwords_array
		puts "*********************************"
	end

end


am = AccountsManager.new

am.add(ac)
am.add(ab)
am.add(ad)

puts am.passwords_hash

am.show_accounts
am.count_insecure_accounts
