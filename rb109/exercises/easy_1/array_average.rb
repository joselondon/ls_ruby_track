def average(arr)
  num = 0
  arr.each_with_object(num) { |element| num += element }
  num / arr.length
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


def average_float(arr)
  num = 0.0
  arr.each_with_object(num) { |element| num += element }
  num / arr.length
end

puts average_float([1, 6])