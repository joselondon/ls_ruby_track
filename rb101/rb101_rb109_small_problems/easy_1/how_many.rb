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
    if count_hash.has_key?(arr[count])
      count_hash[arr[count]] += 1
    else
      count_hash[arr[count]] = 1
    end
    count += 1
  end
  count_hash.each {|k, v| puts "#{k} => #{v}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# expected output/test
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
# suv => 1
