@unit
Feature: About Unit
	Scenario: Open a lesson
		Given I am a regular student
		When I open the studyplan app
		And I login 
		Then I should see the Unit screen
		When I open Lesson "1"
		And I open step "1"
		And I pass the step 100 percent
		And I close the step
		And I return to Dashboard
		Then I open settings screen
		And I logout