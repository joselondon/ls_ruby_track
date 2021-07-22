# Write a program that prompts the user for two positive integers, and then prints the results of the 
# following operations on those two numbers: addition, subtraction, product, quotient, remainder,
# and power. Do not worry about validating the input.

# Example
# 
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

# ALGORITHM
# 
# inputs = integers
# outputs = strings
# 
# 1. Get 2 +ve integers
# 2. Perform each calculation ( +, - , *, /, %, **) using the two inpouted integers
# 3. Output result as part of a string including the two integers and operator.


puts "Enter the first number:"
int_1 = gets.chomp.to_i

puts "Enter the second number:"
int_2 = gets.chomp.to_i

puts "#{int_1} + #{int_2} = #{int_1 + int_2} " 
puts "#{int_1} - #{int_2} = #{int_1 - int_2} " 
puts "#{int_1} * #{int_2} = #{int_1 * int_2} " 
puts "#{int_1} / #{int_2} = #{int_1 / int_2} " 
puts "#{int_1} % #{int_2} = #{int_1 % int_2} " 
puts "#{int_1} ** #{int_2} = #{int_1 ** int_2} " 
