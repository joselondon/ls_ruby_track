# PROBLEM:
# Build a program that randomly generates and prints Teddy's age
# To get the age,you should generate a random number
# between 20 and 200.

# EXAMPLE OUTPUT:
# "Teddy is 69 years old!"

# RULES:
# Input: None
# Output: String
# 
# ALGORITHM:
# 1. Run the program
# 2. Generate a random number and assign to (rand_num) variable
# 3. Print "Teddy is [rand_num] years old!" to screen

def print_teddy_age
  puts "Teddy is #{rand(20..200)} years old!"
end

print_teddy_age()