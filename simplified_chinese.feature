@chinese
Feature: the app should look fine in simplified Chinese
	Scenario: Change language to Chinese on Login page
		Given I am a regular student
		And I open the studyplan app
		And I login
		When I open settings screen
		And I change the language to "简体中文" on settings screen
		And I close settings screen
		And I logout
