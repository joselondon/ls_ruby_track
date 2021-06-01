def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# => "My string looks like this now: pumpkinsrutabaga"

puts "My array looks like this now: #{my_array}"
# => "My array looks like this now: ['pumpkins', 'rutaba']

# Again in both cases the two outer scope variables are passed to the methdod as references to the values
# of a String and an Array method.  String#<< adds to the exisiting String Object so that both the inner
# and outer scope variables point to the sames String Object

# Array#= is a reassignment of the inner scope variable to a new Array object.  So the outer scope variable
# remains untouched.