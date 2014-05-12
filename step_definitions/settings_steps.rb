Then(/^I logout$/) do
	settings_page.logout
end

And(/^I close settings screen$/) do
	settings_page.close
end

And(/^I change the language to "(.*?)" on settings screen$/) do |language| 
	log "Chaning language ..."
	settings_page.change_language(language)
end