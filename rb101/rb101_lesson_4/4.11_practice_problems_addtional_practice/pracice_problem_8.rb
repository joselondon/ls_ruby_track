# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect} #{number}"
  numbers.shift(1)
end
p numbers
# 1
# 3
# numbers == [3,4]


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
p numbers
# 1
# 2

# again numbers == [1, 2]