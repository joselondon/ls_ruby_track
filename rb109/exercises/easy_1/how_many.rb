# Case sensitive
require 'pry'
def count_occurrences(arr)
  labels = arr.uniq

  labels.each do |label|
    puts "#{label} => #{arr.count(label)}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# Case insensitive
def count_occurences_insensitive(arr)
  arr_downcase = arr.map { |element| element.downcase }
  labels = arr_downcase.uniq

  labels.each do |label|
    puts "#{label} => #{arr_downcase.count(label)}"
  end
end
puts
count_occurences_insensitive(vehicles)