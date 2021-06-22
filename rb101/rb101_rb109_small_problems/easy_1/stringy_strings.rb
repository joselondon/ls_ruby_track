# problem:
# Write a method that takes one argument, a positive integer, 
# and returns a string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.
# 
# rules:
# input:  +ve integer
# output: string
# 
# 1.  given a positive integer
# 2.  return a string of alternating 1's and 0's always begining with '1'
# 3.  length of string should always equal the given integer
# 
# implied rules:
# 1.  Only positive integers will be received by the method

# Algorithm
# 1.  given a +ve integer
# 2.  Create an empty string variable - one_zero
# 3.  until length of one_zero equals the given integer
#   a. Check last digit of one_zero
#     if last digit of one_zero = 1
#       push 0 to one_zero
#     else
#       push 1
#     end
# 4. return one_zero

def stringy(int)
  one_zero = ''
  while one_zero.length < int do
    if one_zero.end_with?('1')
      one_zero << '0'
    else
      one_zero << '1'
    end
  end
  one_zero
end

# tests/examples (always evaluating to true):
puts stringy(6) == '101010'     
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
