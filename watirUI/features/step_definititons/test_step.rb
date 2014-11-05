#require 'watir-webdriver'
#require 'colorize'

#browser = Watir::Browser.new

#Given(/^From prime factor number$/) do
  #pending # express the regexp above with the code you wish you had
 # browser.goto "http://192.168.33.11:3000/numbers/new"
#end

#When(/^user enter number$/) do
  #pending # express the regexp above with the code you wish you had#
  # browser.text_field(:id => 'number_prime').set '6'
 # browser.button(:value,"Create Number").click

#end

#Then(/^should display prime factors$/) do
 # puts "Should Enter Prime Number " .red
  #pending # express the regexp above with the code you wish you had
  
#end




Given(/^I am on the Google homepage$/) do
    visit 'http://www.google.com'
end
 
Then(/^I will search for "(.*?)"$/) do |searchText|
    fill_in 'gbqfq', :with => searchText
end
 
Then(/^I should see "(.*?)"$/) do |expectedText|
        #page.should to have_content(expectedText)
end
 
 
Then(/^I will click the about link$/) do
    click_link('About')
end