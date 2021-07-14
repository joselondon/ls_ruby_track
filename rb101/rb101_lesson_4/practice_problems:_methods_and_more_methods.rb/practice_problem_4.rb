# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => {"a" => "ant", "b" => "bear", "c" => "cat"}

# each_with_object iterates over each element in a collection and assigns to the first
# block parameter (value).  A memo collection object is passed to the method via
# parameters, in this case a hash; and passed to the block as a 2nd parameter (hash).
# In this case the cblock takes the value at index 0 of each element(value) ('a', 'b', 'c')
# and assigns as the key of each key, value pair of the memo hash.   Each element(value) is
# then assigned to each key iteratively.  When iteration complete the populated memo object
# is returned.

