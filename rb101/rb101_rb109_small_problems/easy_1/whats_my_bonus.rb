# PROBLEM:
# Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary.
# If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

# IMPLIED RULE:
# Output should always be an integer (not float)

# ALGORITHM:
# inputs:   +ve integer and boolean
# output: integer
# 
# 1.  Given an integer (int)
# 2.  if boolean argument is true return int/2
# 3.  if boolean value is false return 0

def calculate_bonus(int, bonus)
  bonus ? int/2 : 0
end


# TESTS/EXAMPLES
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000