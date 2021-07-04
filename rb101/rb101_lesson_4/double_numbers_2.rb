def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == 6

    numbers[counter] = numbers[counter] * 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers # original array mutated