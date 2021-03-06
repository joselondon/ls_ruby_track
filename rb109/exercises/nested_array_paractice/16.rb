# Practice Problem 16
# 
# A UUID is a type of identifier often used as a way to uniquely identify items...
# which may not all be created by the same system. That is, without any form of synchronization, 
# two or more separate computer systems can create new items and label them with a UUID with no 
# significant chance of stepping on each other's toes.
# 
# It accomplishes this feat through massive randomization. The number of possible UUID values is 
# approximately 3.4 X 10E38.
# 
# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections 
# like this 8-4-4-4-12 and represented as a string.
# 
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# 
# Write a method that returns one UUID when called with no parameters.


digits = %w(a b c d e f 1 2 3 4 5 6 7 8 9 0)

first_str = ''
second_str = ''
third_str = ''
fourth_str = ''
fifth_str = ''
d = "-"

def str_generator(var, digits, length)
  length.times do 
    var << digits.sample
  end
  var
end

str_generator(first_str, digits, 8)
str_generator(second_str, digits, 4)
str_generator(third_str, digits, 4)
str_generator(fourth_str, digits, 4)
str_generator(fifth_str, digits, 12)

uuid = first_str + d + second_str + d + third_str + d + fourth_str + d + fifth_str

p uuid