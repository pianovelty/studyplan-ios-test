class LoginPage < Calabash::IBase

	attr_accessor :login_language

	def initialize(world, transition_duration=0.5)
		@login_language = "English"
		self
	end

	def trait
		"* id:'change language'"
	end

	def login_succeeded?
		element_exists("button marked:'ico settings'") # when Settings icon is visible, then login has succeeded
	end

	def handle_known_exceptions_for_login
		case
		when element_exists("* marked:'You have been logged out because your account has been used on another device. Please log in again.'")
			log_error "You have been logged out because your account has been used on another device. Please log in again."
			touch("button marked:'Close'")
			sleep 1
		when element_exists("* marked:'Please check your username and password then try again.'")
			fail("Please check your username and password then try again.") 
		when element_exists("* marked:'Please try again later.'")
			log_error "Login failed"
			fail("Please try again later.")
		when element_exists("* id:'closeButton'")
			log_error("A Close button popped up")
			touch("* id:'closeButton'")
		end
	end

	def login(username, password)
		change_language_if_necessary

		touch("textField id:'username field'")
		keyboard_enter_text username # sometimes unreliable
		query("textField id:'username field'",{:setText => username}) 
		touch("textField id:'password field'")
		keyboard_enter_text password
		query("textField id:'password field'",{:setText => password})
		sleep 0.2
		touch("button id:'login button'")
	end

	def try_login(username, password)
		timer("Login") do
			login(username, password) 
			wait_for :timeout => 120 do
				login_succeeded? or handle_known_exceptions_for_login
			end
		end
	end

	def change_language_if_necessary(language = nil)
		language ||= @login_language
		return if current_language == language
		wait_for_none_animating
		label("TextFieldLabel").join.to_s
		language.lstrip
    touch("button id:'change language'")
    wait_for_none_animating
    wait_for_elements_exist("view id:'select language #{language}'")
    touch("view id:'select language #{language}'")
    wait_for_none_animating    
	end

  def loading?
    element_exists("* {accessibilityIdentifier BEGINSWITH 'nav_load'}")
  end

  def current_language
  	# is there a better way to identify current language??
  	case label("TextFieldLabel").join.to_s.strip
  	when "usernamepassword"
  		"English"
  	when "用户名密码"
  		"简体中文"
  	end
  end

	def await(wait_opts={})
		
    wait_for(:timeout => 120) do
    	handle_known_exceptions_for_login
    	!loading? 
    end
    self
  end
end