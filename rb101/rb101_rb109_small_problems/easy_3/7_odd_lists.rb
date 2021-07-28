# Write a method that returns an Array that contains every other element of an Array 
# that is passed in as an argument. The values in the returned list should be those 
# values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(array)
  odd_indexed_elements = []
  array.each_with_index do |e, i|
    (i == 0 || i.even?) ? odd_indexed_elements << e : next
  end
  odd_indexed_elements
end

puts  oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts  oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts  oddities(['abc', 'def']) == ['abc']
puts  oddities([123]) == [123]
puts  oddities([]) == []

def evenites(array)
  even_indexed_elements = []
  array.each_with_index do |e, i|
    i.odd? ? even_indexed_elements << e : next
  end
  even_indexed_elements
end

puts  evenites([2, 3, 4, 5, 6]) == [3, 5]
puts  evenites([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts  evenites(['abc', 'def']) == ['def']
puts  evenites([123]) == []
puts  evenites([]) == []