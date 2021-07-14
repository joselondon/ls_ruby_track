[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]

# #select iterates over each element and uses the truthiness of the last expression in the 
# method to 'select' which elements are returned in a new collection.  In this case 'hi' is
# truthy and so every element is returned to the new array.
