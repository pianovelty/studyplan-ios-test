#require 'calabash-cucumber/calabash_steps'
Then(/^I should see the Unit screen$/) do
  log "Current Unit: " + unit_page.current_unit
end

When(/^I open Lesson "(.*?)"$/) do |num|
  unit_page.open_lesson(num)
  log "Current Lesson: #{lesson_page.current_lesson}"
end

And(/^I open settings screen$/) do
	unit_page.open_settings
end