# Write a method that returns true if the string passed as an argument is a palindrome, 
# false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.

# Algorithm
# 1. Take string
# 2. Reverse string
# 3. Check if string and reverse string are equal

def palindrome?(string)
  string == string.reverse
end
# Examples
puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true




