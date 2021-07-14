# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# => [1, 2]

# => not destructive.  
# check ruby docs;  https://ruby-doc.org/core-3.0.2/Enumerable.html#method-i-take
# "Returns first n elements from enum." The word take would indicate not 
# destructive, confirm in irb


