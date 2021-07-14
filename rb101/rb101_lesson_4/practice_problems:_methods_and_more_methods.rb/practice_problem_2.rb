# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# We can find out by refering to the ruby docs:
# https://ruby-doc.org/core-3.0.2/Enumerable.html#method-i-count
# and then running the code in irb to confirm understanding

# #count assesses the truthiness of the block's return value.  Count then
# counts the number of elements that yield a true value.
