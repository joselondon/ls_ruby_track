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

def integer_greater_than_zero?(int)
  int.is_a?(Integer) && int > 0
end


def get_valid_integer
  upper_int = nil
  loop do
    puts "Please enter an integer greater than 0:"
    upper_int = gets.to_i
    break if integer_greater_than_zero?(upper_int)
  end
  upper_int
end

def get_valid_operation
  choice = nil
  loop do
    puts "Enter 's' to compute the sum, 'p' to compute the product"
    choice  = gets.chomp.downcase
    if choice == 's' 
      return 's'
    elsif choice == 'p'
      return 'p'
    else
      puts "Invalid operation please try again"
    end
  end
end

def display_operation_result(integer, operation)
  if operation == 's'
    sum = (1..integer).reduce(:+)
    puts "The sum of the integers between 1 and #{integer} is #{sum}"
  elsif operation == 'p'
    product = (1..integer).reduce(:*)
    puts "The product of the integers between 1 and #{integer} is #{product}"
  end
end


integer = get_valid_integer()
operation = get_valid_operation()
display_operation_result(integer, operation)