# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# => 11

# #pop returns the removed last element of the array.  
# #size is chained and so takes that return value as its caller and 
# counts the number of characters in the string - returning an integer