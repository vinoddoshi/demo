def generate(n)
    return [] if n == 1
    factor = (2..n).find {|x| n % x == 0} 
    [factor] + generate(n / factor) 
end

def finalResult(nums)
str = "Prime Factors :"
strvalues = ""
cnt = nums.count
nums.each do |loc|  
cnt = cnt - 1
strvalues = strvalues + loc.to_s
	if cnt == 0
	puts "Nothing"
	else
	strvalues = strvalues + ", "
	end
	
end  
str = str + strvalues 
return str
end

require 'rubygems'
require 'watir'
require 'watir-webdriver'


browser = Watir::Browser.start "http://ec2-54-167-138-99.compute-1.amazonaws.com:3000/numbers/new"
browser.text_field(:id => 'number_prime').set '6'
num = browser.text_field(:id => 'number_prime').value.to_i
puts num
result = generate (num)
puts result
browser.button(:value,"Create Number").click

str1 = finalResult(result)
puts "Formated" << "#{str1.to_s} "
Watir::Wait.until { browser.text.include? 'Number was successfully created' }
puts " Actual Result:"
if browser.text.include? "Number was successfully created"
  puts "  Test Passed."
else    
  puts "  Test Failed! "
end
str2 = "" << "#{str1.to_s}"

if browser.text.include?"#{str2.to_s}"
  puts "  Test Passed."
else    
  puts "  Test Failed! "
end

