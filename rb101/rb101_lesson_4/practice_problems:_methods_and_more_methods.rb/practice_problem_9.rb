# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, 'bear']

# map returns an array.  The array is populated by the return values of the block.
# In this case the return is nil where if statement evaluates to false or the value of 
# the hash pair if the if statement evaluates to true.