# What is the block's return value in the following code? How is it determined? 
# Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# block's return vlaue is the last expression assessed: num.odd?   and
# will return true or false (a boolean) based on whether each element is odd or not

# return value of any? in this case will be true if teh block EVER returns
# a truthy value.  In thi case the return value of any? is TRUE

#  any? stops iterating after the first true return from the block, so 
# only 1 gets output to screen


