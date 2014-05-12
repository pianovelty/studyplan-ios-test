@login
Feature: User Login
	Scenario: User login
		Given I am a regular student
		When I open the studyplan app
		Then I should be able to login successfully
		Then I open settings screen
		And I logout