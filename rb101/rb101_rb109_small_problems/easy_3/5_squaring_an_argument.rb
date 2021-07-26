# Create a method that takes two arguments, multiplies them together, 
# and returns the result.

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power_up(num, power)
  multiply(num, num**(power-1)) 
end

p power_up(3, 5)
