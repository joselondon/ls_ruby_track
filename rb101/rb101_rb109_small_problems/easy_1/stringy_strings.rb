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

# modified version rules:
# 1. allow an  optional argument defaulting to 1.
# 2. If method is called with this argument set to 0,
#   the method should return a String of alternating 
#   0s and 1s but starting with 0 instead of 1.
# 
# Algorithm:
# 1. Allow a second argument, optional and defaulting to 1
# 2. Check if optional argument is set to 1
#     if yes 
#     even indexes are set to 0
#     else if the optional argument is not supplied or is 0
#     even indexes are set to 1
# 3. keep going until string length == integer
# 4.  return str

def stringy_2(int, srt = 1)
  str = []
  int.times do |index|
    if srt = 1
      num  = index.even? ? 0 : 1
    elsif srt = 0
      num = index.even? ? 1 : 0
    end
    str << num
  end
  str.join
end

# tests/examples (always evaluating to true):
 puts stringy_2(6) == '010101'
 puts stringy_2(9) == '010101010'
 puts stringy_2(4) == '0101'
 puts stringy_2(7) == '0101010'