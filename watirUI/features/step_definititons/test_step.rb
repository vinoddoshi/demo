require 'watir-webdriver'
require 'colorize'

browser = Watir::Browser.new

Given(/^From prime factor number$/) do
  #pending # express the regexp above with the code you wish you had
  browser.goto "http://192.168.33.11:3000/numbers/new"
end

When(/^user enter number$/) do
  #pending # express the regexp above with the code you wish you had#
  # browser.text_field(:id => 'number_prime').set '6'
  browser.button(:value,"Create Number").click

end

Then(/^should display prime factors$/) do
  puts "Should Enter Prime Number " .red
  #pending # express the regexp above with the code you wish you had
  
end