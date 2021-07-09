# PROBLEM:
# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product 
# of all numbers between 1 and the entered integer.

# ALGORITHM:
# Inputs:  Integers and single char String
# Output: String
# 1. Prompt user for an integer greater than 0
# 2. Prompt user for string 's' or 'p'
# 2. list each integer between 1 and the given integer 
# 3. iterate over each number adding starting with 1 adding the sequntial integer 
#     or mutiplying the sequntial integer depending on whether the given string
#     is 's' or 'p' respectively
# 4. outputs the sum for 's' or pruduct for 'p'


  




def sum_or_product
  puts "Please enter an integer greater than 0:"
  initial_int = gets.to_i
  puts
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  choice = gets.chomp.downcase

  array = (1..initial_int).to_a
  sum = 0
  prod = 1
loop do
  break if array.size == 0
  if choice == 's'
    sum = sum + array.shift
  elsif choice == 'p'
  prod = array[0] * array.shift
  end
end
p sum



end

sum_or_product()
