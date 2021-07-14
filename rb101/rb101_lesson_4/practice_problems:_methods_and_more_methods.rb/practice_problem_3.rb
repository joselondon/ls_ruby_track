# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]

# #reject returna an array of all the elements for which the block returns
# a false value.  In this case the return value of a puts statement is nil
# which evaluates to false