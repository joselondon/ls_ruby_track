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
def get_number(ss_ordinator)
  puts "Please enter #{ss_ordinator} number"
  number = gets.chomp.to_f
end

def greater_than_zero?(number)
  until number > 0
    puts "Please enter a number greater than zero"
    number = gets.chomp.to_f
  end
  number
end

int_1 = get_number("first")
puts
int_2 = greater_than_zero?(get_number("second"))
operators = ["+", "-", "*", "/", "%", "**"]

operators.each do |operator| 
  answer = int_1.public_send(operator, int_2)
  puts "==> #{int_1} #{operator} #{int_2} = #{answer}"
end


