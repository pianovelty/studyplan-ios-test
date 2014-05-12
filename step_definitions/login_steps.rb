Given(/^I am a regular student$/) do
	@user = User.new username: "best3", password: "1"
	log "User < #{@user.username} > is trying to login with password < #{@user.password} >"
end

When(/^I login$/) do
  login_page.try_login(@user.username, @user.password)
end

Then(/^I should be able to login successfully$/) do
  macro %Q[I login]
end

When(/^I open the studyplan app$/) do
	login_page
end

And(/^I change the language to "(.*?)" on login screen$/) do |language| 
	login_page.login_language = language.strip
end