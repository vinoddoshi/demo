
require 'watir'
gem 'test-unit'
require 'test/unit'

class Search < Test::Unit::TestCase

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


def setup
@b = Watir::Browser.new :ff
@b.goto "http://192.168.33.11:3000/numbers/new"
end

def teardown

end

def test_Search 
@b.text_field(:id => 'number_prime').set '6'
num = @b.text_field(:id => 'number_prime').value.to_i
puts num
result = generate (num)
puts result
@b.button(:value,"Create Number").click

str1 = finalResult(result)
puts "Formated" << "#{str1.to_s} "
Watir::Wait.until { @b.text.include? 'Number was successfully created' }
puts " Actual Result:"
if @b.text.include? "Number was successfully created"
  puts "  Test Passed."
else    
  puts "  Test Failed! "
end
str2 = "" << "#{str1.to_s}"

time1 = Time.new


File.open('testResult.txt', 'w') do |f2|  
      f2.puts "Start Date and Time : " + time1.inspect
      f2.puts "Entered Prime Number :" + num.to_s
      f2.puts "Expected " + "#{str1.to_s} "
      


if @b.text.include?"#{str2.to_s}"
  f2.puts "Actual prime factors shows same on page"
  assert_equal 1, 1
else    
  f2.puts "Actual prime factors shows different on page"
  assert_equal 1, 2
end

end  #File end


end

end



