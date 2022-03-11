require 'date'

print "What is your age?  "
age = gets.chomp.to_i
puts
print "At what age would you like to retire?  "

retire_age = gets.chomp.to_i
current_year = DateTime.now.year
years_to_retire = retire_age - age
year_of_retirement = current_year + years_to_retire

puts "It's #{current_year}.  You will retire in #{year_of_retirement}."
puts "You have only #{years_to_retire} years of work to go!"