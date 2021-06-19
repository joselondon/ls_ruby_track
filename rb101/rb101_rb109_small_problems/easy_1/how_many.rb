# input:  array
# output: hash
# 
# problem:
# Write a method that counts the number of occurrences of each element in a given array.
# 
# rules:
# 1.  given an array
# 2.  iterate over array
# 3.  take the first uniqe element and add as key to a has with value 1
# 4.  keep going through the array - 
#       check if key already exists if not add new key
#       if key exists increase value of existing key by 1
#       end when array.length method
# 5.  Print hash results as key value pairs

def count_occurrences(arr)
  count_hash = Hash.new
  count = 0
  while count < arr.length
    puts arr[count]
    count += 1s
  end
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
# 
count_occurrences(vehicles)
# 
# expected output
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

