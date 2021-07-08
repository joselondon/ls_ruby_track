# PROBLEMS:
# Print all odd numbers from 1 to 99, inclusive, to the console, 
# with each number on a separate line.

# ALGORITHM:
# input:  none
# output: integers 1..99
# 
# 1. Iterateover number 1..99
# 2. For each number determine if the number is odd
# 3. If the number is odd display to screen on new line
# 4. Otherwise move to next number

def odd_numbers
  for i in 1..99
    puts i if i.odd?
  end
end

odd_numbers()

