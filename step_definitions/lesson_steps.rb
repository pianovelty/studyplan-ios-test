When(/^I open step "(.*?)"$/) do |num|
  lesson_page.open_step(num)
end

And(/^I return to Dashboard$/) do
	lesson_page.back_to_dashboard
	wait_for_none_animating 
	sleep 1 # to implement a more robust strategy
end