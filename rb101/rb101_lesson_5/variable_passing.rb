# def increment(a)
# a = a + 1
# end
# 
# b = 3
# puts increment(b)   # prints 4
# puts b              # prints 3

# def append(s)
#   s << '*'
# end
# 
# t = 'abc'
# puts append(t)  # prints abc*
# puts t          # prints abc*

# https://launchschool.medium.com/variable-references-and-mutability-of-ruby-objects-4046bd5b6717
# MENTAL MODEL ONE
# Ruby is pass by value for imuutable objects, and pass by reference otherwise.

# def fix(value)
#   value.upcase!
#   value.concat('!')
#   value
# end

def fix(value)
  puts "initial object #{value.object_id}"
  value = value.upcase
  puts "upcased object #{value.object_id}"
  value.concat('!')
end

s = 'hello'
puts "original object #{s.object_id}"
t = fix(s)
puts "final object #{t.object_id}"
puts
puts s
puts t 

# MENTAL MODEL TWO
# https://launchschool.medium.com/ruby-objects-mutating-and-non-mutating-methods-78023d849a5f
# Assignment can break the binding between an argument name and the object it references.
# This is important to keep in mind when examining the relationships between variables
# and objects.

# FINAL MENTAL MODEL
# Most accurate:   Ruby is PASS BY REFERENCE VALUE not especially useful from a practical point of view
# Acceptable:  Ruby is PASS BY REFERENCE accurate as long as you account for assignement
# and immutability
# Inaccurate but practical:  Ruby ACTS LIKE PASS BY VALUE FOR IMMUTABLE OBJECTS and PASS BY 
# REFERENCE FOR MUTABLE OBJECTS.  HOWEVER it only appears to acts like this.
# https://launchschool.medium.com/ruby-objects-mutating-and-non-mutating-methods-78023d849a5f