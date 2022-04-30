# Practice Problem 13

# Given the following data structure, return a new array containing the same sub-arrays 
# as the original but ordered logically by only taking into consideration the odd numbers 
#they contain.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# expected output =>  [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

new_arr = arr.sort_by do |sub_arr|
  sub_arr.select {|el| el % 2 == 1}
end

p new_arr