import unittest
import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


class GmailTest (unittest.TestCase):

	def setUp(self):
		self.driver = webdriver.Chrome()

	def testSendEmail(self):
		driver = self.driver
		driver.get('http://www.gmail.com')
		self.assertIn('Gmail', driver.title)
		loginBox = driver.find_element_by_name('identifier')
		assert loginBox
		loginBox.send_keys('gd200620@gmail.com')
		emailNextButton = driver.find_element_by_id('identifierNext')
		assert emailNextButton
		emailNextButton.click()
		time.sleep(1)
		passwordBox = driver.find_element_by_name("password")
		assert passwordBox
		passwordBox.send_keys('200620gd')
		passwordNextButton = driver.find_element_by_id('passwordNext')
		assert passwordNextButton
		passwordNextButton.click()
		time.sleep(2)
		composeBox = driver.find_element_by_class_name("z0")
		assert composeBox
		composeBox.click()
		time.sleep(2)
		toBox = driver.find_element_by_name("to")
		assert toBox
		toBox.send_keys('test@example.com')
		time.sleep(2)
		subjectBox = driver.find_element_by_name("subjectbox")
		assert subjectBox
		subjectBox.send_keys('Test Subject')
		time.sleep(2)
		bodyBox = driver.find_element_by_css_selector("div[aria-label='Message Body']")
		assert bodyBox
		bodyBox.send_keys('This is message')
		time.sleep(2)
		sendBox = driver.find_element_by_xpath("//div[text()='Send']")
		assert sendBox
		sendBox.click()

	def tearDown(self):
		self.driver.quit()

if __name__ == '__main__':
	unittest.main(verbosity=2)
