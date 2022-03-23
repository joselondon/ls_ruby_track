def multiply(num1, num2)
  num1 * num2
end

# => multiply(3, 5) == 15

multiply([2, 4], 5) == [2, 4, 2, 4, 2, 4, 2, 4, 2, 4]
# It appears the element pattern [2, 4] is muliplies 5 times within 
# the returned array.

def square(num)
  multiply(num, num)
end

p square(5) == 25
p square(-8) == 64

puts 

def power_of(num, n)
  powered = 1
  n.times { powered = multiply(powered, num)}
  powered
end

p power_of(3, 3) == 27
p power_of(3, 4) == 81
p power_of(-4, 8) == 65536
p power_of(10, 4) == 10000