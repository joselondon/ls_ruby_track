def oddities(array)
  array.select {|element| (array.index(element) + 1).odd?}
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])

puts

def oddities_two(array)
  array.select {|element| (array.index(element) + 2).odd?}
end

p oddities_two([2, 3, 4, 5, 6]) == [3, 5]
p oddities_two([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_two(['abc', 'def']) == ['def']
p oddities_two([123]) == []
p oddities_two([]) == []

def oddities_two_2(array)
  result = []
  array.each_with_index do |element, i|
    result << element if (i + 1).even?
  end
  result
end

puts
p oddities_two_2([2, 3, 4, 5, 6]) == [3, 5]
p oddities_two_2([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_two_2(['abc', 'def']) == ['def']
p oddities_two_2([123]) == []
p oddities_two_2([]) == []

def oddities_two_3(array)
  index = 0
  new_array = []
  loop do
    break if counter > (array.length + 1)
    if (array[index] +1) % 2 == 0
      new_array << array[index + 1]
    end
    index += 1
  end
  new_array
end

puts

p oddities_two_2([2, 3, 4, 5, 6]) == [3, 5]
p oddities_two_2([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_two_2(['abc', 'def']) == ['def']
p oddities_two_2([123]) == []
p oddities_two_2([]) == []