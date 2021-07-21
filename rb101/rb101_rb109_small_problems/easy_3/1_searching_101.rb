# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not the 
# 6th number appears amongst the first 5 numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
# 
# 
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

# ALGORITHM
# Inputs:   integers
# Output:   string
# 
# 1.  Obtain a number from the user
# 2.  Add that number to a collection
# 3.  repeat process until the collection length == 5
# 4.  collect one more number from user
# 5.  run through collection and confirm if final number exisits within the collection
# 6. Output result of check in a text display to user
# 
# Implied rules
# 1.  input should be integers


SS_ORDS = {
  1=>'st',
  2=>'nd',
  3=>'rd',
  4=>'th',
  5=>'th'
}

def get_num_array
  num_array = []

  for i in (1..6)
    if i == 6
      puts "Please enter the last number:"
    else 
      puts "Please enter the #{i}#{SS_ORDS[i]} number:"
    end
    num_array << gets.to_i
  end
  num_array
end

def calculate_response(num_array)
  num_array
  if num_array[0..4].include?(num_array[5])
    puts "The number #{num_array[5]} appears in #{num_array[0..4]}."
  else
    puts "The number #{num_array[5]}  does not appear in #{num_array[0..4]}"
  end
end

calculate_response(get_num_array())