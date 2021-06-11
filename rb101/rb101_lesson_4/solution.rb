def sum_even_number_row(row_number)
  rows = []
  # steps 2 & 3
  rows # TODO: sum the final row and return the sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 4 --> sum of integers in row: 68

p sum_even_number_row(1) # == 2  # true
# p sum_even_number_row(2) == 10  # true
# p sum_even_number_row(4) == 68  # true



# start:  2, length: 1 --> [2]
# start:  4, length: 2 --> [4, 6]
# start:  8, length: 3 --> [8, 10, 12]

# p create_row(2, 1) == [2]         # true
# p create_row(4, 2) == [4, 6]      # true
# p create_row(8, 3) == [8, 10, 12] # true

# Create row algorithm:
# 1.  Create an empty 'row' to contain the integers
# 2.  Add the starting integer
# 3.  Increment the starting integer bby 2 to get the next integer in the sequence
# 4.  Repeat steps 2 & 3 until the array has reached the correct length
# 5.  Return the 'row' array

# Start the loop 
#   - Add the start integer to the row
#   - Increment the start integer by 2
#   - Break out of the loop if length of row equals row_length


# Main algorithm
# 1.  Create an empty 'rows' array to contain all of the rows
# 2.  Create a 'row' array and add it to the overall 'rows' array
# 3.  Repeat step 2 until all the neccessary rows have been created
#   - all rows have been created when the length of the 'rows' array is equal to the input integer
# 4.  Sum the final row
# 5.  Return the sum