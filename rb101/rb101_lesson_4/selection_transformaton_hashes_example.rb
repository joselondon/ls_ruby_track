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

# def select_fruit(produce)
#   fruits = Hash.new
#   produce.each do |product, category|
#     fruits[product] = category if category == 'Fruit'
#   end
#   fruits
# end

def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}