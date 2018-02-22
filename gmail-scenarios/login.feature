Feature: Login to gmail.com

	Scenario: Check Email or phone input field
		Given I am on webpage account.google.com/signin
		And My user location is "us_EN"
		And I can see "Email or phone" input field
		When I click on "Email or phone" input field
		Then "Email or phone" input field should be "focus" and "enable"

	Scenario: Check
		Given I am on webpage account.google.com/signin
		And My user location is "us_EN"
		And I can see button "NEXT"
		When I click on button "NEXT"
		Then I should see "Enter an email or phone number"

	Scenario: User provided not existing user name
		Given I am on webpage account.google.com/signin
		And My user location is "us_EN"
		When I enter Email "1@gmail.com"
		And I click button "NEXT"
		Then I should see "Couldn't find your Google Account"

	Scenario: User provided invalid user name
		Given I am on webpage account.google.com/signin
		And My user location is "us_EN"
		When I enter Email "@gmail.com"
		And I click button "NEXT"
		Then I should see "Enter a valid email or phone number"

	Scenario: User provided existing user name
		Given I am on webpage account.google.com/signin
		And My user location is "us_EN"
		When I enter Email "test@gmail.com"
		And I click button "NEXT"
		Then I should see "Welcome" and "test@gmail.com"
		And I can see "Enter your password" input field

	Scenario: User provided wrong password for existing account
		Given I am on webpage account.google.com/signin
		And My user location is "us_EN"
		And I can see "Welcome" and "test@gmail.com"
		And I can see "Enter your password" input field
		When I enter "123456" to "Enter your password" input field
		And I click button "NEXT"
		Then I can see "Wrong password. Try again or click Forgot password to reset it."

	Scenario: User provided empty password
		Given I am on webpage account.google.com/signin
		And My user location is "us_EN"
		And I can see "Welcome" and "test@gmail.com"
		And I can see "Enter your password" input field
		When I enter "" to "Enter your password" input field
		And I click button "NEXT"
		Then I can see "Enter a password"

	Scenario: User provided wrong password
		Given I am on webpage account.google.com/signin
		And My user location is "us_EN"
		And I can see "Welcome" and "test@gmail.com"
		And I can see "Enter your password" input field
		When I enter ".*" to "Enter your password" input field
		And I click button "NEXT"
		Then I can see "Wrong password. Try again or click Forgot password to reset it."

	Scenario: User log in successfully
		Given I am on webpage account.google.com/signin
		And My user location is "us_EN"
		And I can see "Welcome" and "test@gmail.com"
		And I can see "Enter your password" input field
		When I enter "1234" to password input field
		And I click button "NEXT"
		Then I should see my emails
