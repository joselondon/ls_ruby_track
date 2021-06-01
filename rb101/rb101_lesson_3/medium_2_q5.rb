# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"
# end
# 
# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method(my_string, my_array)
# 
# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"
# puts

# could be changed by creating two single purpose methods and renaming them to better reflect their purposes: -

def string_append_rutabaga(a_string_param)
  a_string_param += "rutabaga"
end

def add_array_element!(an_array_param)
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
string_append_rutabaga(my_string)
add_array_element!(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
