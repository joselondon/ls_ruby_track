# Write a method that returns true if its integer argument is 
# palindromic, false otherwise. A palindromic number reads the same 
# forwards and backwards.

# def palindromic_number?(num)
#   num.to_s.reverse == num.to_s
# end
# 
# puts palindromic_number?(34543) == true
# puts palindromic_number?(123210) == false
# puts palindromic_number?(22) == true
# puts palindromic_number?(5) == true
require 'pry'

def get_number?
  puts "Enter number"
  num = gets.chomp
end

def palindromic_number_2?(num = get_number?)
  num == num.reverse
end

puts palindromic_number_2? 
# puts palindromic_number_2?(002000) == false
# puts palindromic_number_2?(34543) == true
# puts palindromic_number_2?(123210) == false
# puts palindromic_number_2?(22) == true
# puts palindromic_number_2?(5) == true
 