class SettingsPage < Calabash::IBase

	def trait; "view id:'logout button'" end

	def logout
		case login_page.login_language 
		when "Englsih"
			touch("button marked:'Logout'") 
		when "简体中文"
			touch("button marked:'退出'")
		end
	end

	def change_language(language)
		touch("view:'EFSettingsCell' index:1") # index:0 use cellular data, index:1 change language, index:2 about the app
		wait_for_none_animating
		sleep 1
		touch("view marked:'#{language.strip}'")
		wait_for_none_animating

		wait_for(:time_out => 120) do
			handle_change_language_exception
			not loading?
		end
		wait_for_none_animating
	end

	def loading?
		sleep 1
		element_exists("* id:'nav_load_pink_col3.png'")
	end

	def handle_change_language_exception
		sleep 2
		case 
		when element_exists("* marked:'Close'")
			touch("button marked:'Close'")
			log_error("Change language error")
		when element_exists("* marked:'结束'")
			touch("button marked:'结束'")
			log_error("Change language error")
		end
	end

	def close
		touch("view id:'ico_settings.png'")
		wait_for_none_animating
	end
end