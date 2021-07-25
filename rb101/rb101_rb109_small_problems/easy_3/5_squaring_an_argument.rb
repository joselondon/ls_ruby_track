# Create a method that takes two arguments, multiplies them together, 
# and returns the result.

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end
# Test/Example:
p square(5)
p square(-8)

def power_up(power, num)
  if power == 2
    multiply(num, num)
  else
    multiply(num, num) ** power
  end
end

p power_up(3, 3)

