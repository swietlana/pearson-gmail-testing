Feature: Send email

	Scenario: Creating email
		Given I am logged in to gmail.com
		And I can see button "COMPOSE"
		When I click on button "COMPOSE"
		Then I should see a "New Message" window
		And I should see input fields: ["To", "From", "Subject"]
		And I should see "Message Body" input field

	Scenario: Creating email without recipient
		Given I am logged in to gmail.com
		And I can see "New Message" window
		And I can see "Send" button
		When I click "Send" button
		Then I should see "Error. Please specify at least one recipient."

	Scenario: Sending email with only a recipient
		Given I am logged in to gmail.com
		And I can see "New Message" window
		When I enter "test@gmail.com" in "To" input field
		And I click "Send" button
		Then I should see "mail.google.com says Send this message without a subject or text in the body?"
		And I should see "Cancel" button
		And I should see "OK" button

	Scenario: Accept sending email without subject or text
		Given I am logged in to gmail.com
		And I can see "mail.google.com says Send this message without a subject or text in the body?"
		And I can see "Cancel" button
		And I can see "OK" button
		When I click "OK" button
		Then I can see "Your message has been sent"

	Scenario: Cancel sending email without subject or text
		Given I am logged in to gmail.com
		And I can see "test@gmail.com" in "To" input field in "New Message" window
		And I can see "mail.google.com says Send this message without a subject or text in the body?"
		And I can see "Cancel" button
		And I can see "OK" button
		When I click "Cancel"
		Then I should see "New Message" window
		And I should see "test@gmail.com" in "To" input field

	Scenario: Sending email with text but without subject
		Given I am logged in to gmail.com
		And I can see "New Message" window
		When I enter "test@gmail.com" in "To" input field
		And I enter "Message" into "Message Body" input field
		And I click "Send" button
		Then I should see "Your message has been sent"

	Scenario: Sending email with subject but without text
		Given I am logged in to gmail.com
		And I can see "New Message" window
		When I enter "test@gmail.com" in "To" input field
		And I enter "Test Subject" into "Subject" input field
		And I click "Send" button
		Then I should see "Your message has been sent"

	Scenario: Creating email with attachment
		Given I am logged in to gmail.com
		And I can see "New Message" window
		When I enter "test@gmail.com" in "To" input field
		And I click "Attach files" icon
		Then I should see "Files Manager" window

	Scenario: Adding too big attachment to email
		Given I am logged in to gmail.com
		And I can see "New Message" window
		And I can see "Files Manager" window
		When I click a file "picture_30MB.png"
		Then I should see "Your file is larger than 25MB. It will be sent as a Google Drive link."

	Scenario: Adding an attachment to email
		Given I am logged in to gmail.com
		And I can see "New Message" window
		And I can see "Files Manager" window
		When I click a file "picture.png"
		Then I should see "picture.png" inside the "New Message" window

	Scenario: Sending an email with attachment
		Given I am logged in to gmail.com
		And I can see "New Message" window
		And I can see "picture.png" inside the "New Message" window
		When I click "Send" button
		Then I should see "Your message has been sent"

	Scenario: Checking sent email in "Sent Mail" category
		Given I am logged in to gmail.com
		And I can see "New Message" window
		And I can see "test@gmail.com" in "To" input field
		And I can see "Test Subject" in "Subject" input field

		When I click "Send" button
		Then I can see "Your message has been sent"

		When I click "Sent Mail" category
		Then I can see "To:test@gmail.com"
		And I can see "Test Subject"
