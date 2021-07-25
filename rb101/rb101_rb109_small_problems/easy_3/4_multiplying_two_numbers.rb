# Create a method that takes two arguments, multiplies them together, 
# and returns the result.

def multiply(num1, num2)
  test = num1 * num2
  (test.is_a?(Integer) || test.is_a?(Float)) ? test : "Invalid numbers"
end

# Test/Example:
puts multiply(5.2, 3.4)
puts multiply(2, 4)
puts multiply("x", 2)