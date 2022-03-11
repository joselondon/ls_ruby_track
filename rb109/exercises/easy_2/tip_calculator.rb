require 'pry'
PERCENTILE = 100
ROUND = 2
CURRENCY = 'US$'
print "What is the bill?  "
bill = gets.chomp.to_f

print "What is the tip percentage?  "
tip_percent = gets.chomp.to_f/PERCENTILE

tip = (bill * tip_percent).to_f
total  = (bill + tip).to_f
puts
puts "The tip is #{CURRENCY}#{format("%.2f", tip)}"
puts "The total is #{CURRENCY}#{format("%.2f", total)}"