def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# "My string looks like this now: pumpkins"  

puts "My array looks like this now: #{my_array}"
# "My array looks like this now: ["pumpkins", "rutabaga"]" .  

# both variables are passed in to the method as object references, one to a String object and one to an Array object.
# the method then initalizes two new method scope variables of the same name in this case.

# += is re-assignment and creates a new String object which is then assigned to the method variable my_string.  The outer and 
# inner scope variables therefore now point to different values.  ie the outerscope variable still points to the String
# "pumpkins".  Re-asssignement does not mutate the original String.  It points to a new object

# Array#<< does mutate the original object.  Adding a new element to the existing Array object. therefore the inner and outer 
# scope variables still point to the original object.




