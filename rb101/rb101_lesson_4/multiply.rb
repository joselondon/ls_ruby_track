def multiply(numbers, multiplier)
  counter = 0

  loop do
    break if counter == numbers.length

    numbers[counter] = numbers[counter] * multiplier

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
