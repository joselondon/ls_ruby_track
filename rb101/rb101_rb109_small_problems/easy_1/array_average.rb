# problem:
# Write a method that takes one argument, an array containing 
# integers, and returns the average of all numbers in the array. The 
# array will never be empty and the numbers will always be positive
# integers. Your result should also be an integer.

# rules:
# input: array of integers
# output: integer
# 
# 1. given an array of integers (arr)
# 2. return an integer (average) that represents an average of all the
#    integers contained in int.
# 3. arr will never be empty
# 4. integers in the arraay will always be natural numbers
# 5. in the event of the modulus being greater than zero, round down (integer division)

# Algorithm
# 1. Given array of integers 
# 2. sum up the elements in the array
# 3. divide the sum by the number of elements and assign to average variable
# 4. return average variable


def average(arr)
  arr.sum/arr.length
end

# tests/examples
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

