=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an 
Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
=end






def alphabetic_number_sort(num_arr)
  words = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten,
    eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen,
    eighteen, nineteen)
  sorted_pair_arr = words.zip(num_arr).sort
  sorted_pair_arr.map {|pair| pair[1]}
end

p alphabetic_number_sort((0..19).to_a)  == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0]
