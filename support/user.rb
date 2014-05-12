class User
	attr_reader :username, :password

	def initialize(args)
		@username = args[:username]
		@password = args[:password]
	end

end