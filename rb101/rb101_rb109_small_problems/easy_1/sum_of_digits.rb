# PROBLEM 
# Write a method that takes one argument, a positive integer, and returns the sum of its digits.
# 
# ALGORITHM
# input:  a +ve integer
# output: integer
# 
# 1.  Split the integer into its individual digits
# 2.  Sum the individual digits
# 3.  Return the sum of the digits to screen

def sum(int)
  int.to_s.split('').reduce do |sum, digit|
    sum.to_i + digit.to_i
  end
end


# TESTS/EXAMPLES
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
