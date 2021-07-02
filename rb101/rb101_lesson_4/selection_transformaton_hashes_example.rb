#PROBLEM:
#select the key-value pairs where the value is 'Fruit'.

# ALGORITHM:
# input: hash
# output: hash
# 1.  For each value pair in a hash
# 2.  Check if the value of the pair  == 'Fruit'
# 3.  Select the key of the fruit and populated to a new hash


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}