# input:    integer
# outputs:  boolean values true or false
# 
# Rules:
# 1.  integer (int) can be +ve, -ve, or 0
# 2.  we can assume a valid integer is supplied
# 
# Alg:
# 1.  Given an integer - int 
# 2.  return the boolean true if int is an odd values
# 3.  assume false is returned if int is not an odd value

def is_odd?(int)
  int % 2 == 0 ? false : true
end

# examples/tests

puts is_odd?(2)   == false
puts is_odd?(5)   == true
puts is_odd?(-17) == true
puts is_odd?(-8)  == false
puts is_odd?(0)   == false
puts is_odd?(7)   == true

