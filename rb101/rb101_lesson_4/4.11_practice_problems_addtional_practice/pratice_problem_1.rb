# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.



# ALGORITHM
# Inputs:  array
# Outputs: hash

# 1. given array
# 2. Iterate over each element and take each element and its index
# 3. Do this in a way that mutates the elements in place
# 4. Convert original array to hash when done?




# hash = {}
# 
# flintstones.each_with_index do|flint, index|
#   hash[flint] = index
# end
# 
# flintstones = hash

# OR

flintstones = flintstones.each_with_index.each_with_object({}) do |(flint, index), hash|
  hash[flint] = index
end



