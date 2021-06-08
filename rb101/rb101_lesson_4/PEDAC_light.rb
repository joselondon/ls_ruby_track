# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []


# ANALYSIS

# input:  string
# output: an array of substrings
# rules:
#     Explicit requirements:
#       - every palindrome must be returned to a single array
#       - each palindrome substring forms one element of the array
#       - Palindromes are case sensitive ("Bab" is not a palindrome, "bab" is)
#     Implicit requirements:
#       - Where there are no palindromes in a given string, return an empty 
#         array
#       - If given an empty string, return an empty array
#       - Palindromes should retain their original case ("BaB" stays "BaB")
#       -WILL INPUTS ALWAYS BE STRINGS?
#       - ARE 'WORDS' FORMED AS SUBSTRINGS INTEDED TO BE DICTIONARY WORDS OR JUST SIMPLE
#         SUBSTRINGS?

# ==================================================================================

# Mental Model of PROBLEM
# 
# Two part PROBLEM
# 1. Create a list of the substrings within a string
# 2. Iterate over those substrings and determine if a substring is a palindrome
# 
# Return each palindrome substrings to a results array

# ==================================================================================

# Algorithm
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the 
#    substrings of the input string that are at least 2 characters long
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << susbstring if is_palindrome?(substring)
  end
  result
end

# substrings() PROBLEM ANALYSIS
# taking a short string such as 'halo', extracting all substrings of length 2 or more.
# would result in ['ha', 'hal', 'halo', 'al', 'alo', 'lo'].   Illustrates a complex 
# looping pattern at work.

# Needs an outer loop iterating over the starting index for the substrings  ie with 'halo'
# needs to iterate over the letters 'h', 'a', and 'l' we can skip 'o' as there are no 
# substrings with at least 2 characters that start with 'o'.

# Within the first loop we need to iterate over the substrings at the given starting index
# It's easiest to start with th esubstring of length 2, then the substring of length 3 and
# so on.   
# ===========================================================================================
# Resulting Algorithm loop
# for each starting index from 0 through to the next to last position
#   for each substring length from 2 until there are no substrings of that length
#     extract the substring of the indicated length starting at the indicated index position
#   end of inner loop
# end of outer loop

# ============================================================================================
# We can determine that the outer loop iterates over the indexes from 0 to the length of the 
# next to the last index position (e.g., string.length - 2). We can also see that the inner 
# loop ranges from 2 to the original string length minus the  starting index
# (string.length - startingIndex).   We can now write te full algorithm: -
# ============================================================================================

# FULL ALGORITHM

# - create an empty array called 'result' that willcontain all required substrings
# - create a 'starting_index' variable (value '0') for the starting index of a substring
# - start a loop tha iterates over 'starting_index' from '0' to the length of the string minus 2
#   - create a 'num_chars' variable (value '2')  for the length of a substring
#   - start an inner loop that iterates over 'num_chars' from '2' to 'string.length -starting_index'
#     - extract a substring of length 'num_chars' from 'string' starting at 'starting_index'
#     - append the extracted substring to the 'result' array
#     - increment the 'num_chars' variable by '1'
#   - end the inner loop
#   - increment the 'starting_index' variable by '1'
# - end the outer loop
# - return the 'result' array

# ============================================================================================
# Optional step could be to turn this into psuedocode: 
# ============================================================================================

# START
#
#   /* Given a string named 'string' * /
#   
#   SET result = []
#   SET starting_index = 0
#
#   WHILE starting_index <= length of string - 2
#     SET num_Chars = 2
#     WHILE num_Chars <= length of string - starting_index
#       SET substring = num_chars characters from string starting at index starting_index
#       append substring to result array
#       SET num_chars = num_chars + 1
#
#     SET starting_index = starting_index +1
#
#   RETURN result
#
#END

def substring(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length -2_
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

# Palindrome check algorithm

# - Inside the 'is_palindrome?' method, check whther the string
#   value is equal to its reversed value.  You can use the
#   String#reverse method.

def is_palidrom?(str)
  return str == str.reverse
end

# FULL FINAL ALGORITHM

# input:  a string
# output: and array of substrings
# rules:  palindrome words shouldbe cse sensitive, meaning "sbBA"
#         is not a palindrome

# Algorithm
# substrings method
# =================
# - create an empty array called 'result' that willcontain all required substrings
# - create a 'starting_index' variable (value '0') for the starting index of a substring
# - start a loop tha iterates over 'starting_index' from '0' to the length of the string minus 2
#   - create a 'num_chars' variable (value '2')  for the length of a substring
#   - start an inner loop that iterates over 'num_chars' from '2' to 'string.length -starting_index'
#     - extract a substring of length 'num_chars' from 'string' starting at 'starting_index'
#     - append the extracted substring to the 'result' array
#     - increment the 'num_chars' variable by '1'
#   - end the inner loop
#   - increment the 'starting_index' variable by '1'
# - end the outer loop
# - return the 'result' array

# is_palindrome? method
# =====================
# - Inside the 'is_palindrome?' method, check whther the string
#   value is equal to its reversed value.  You can use the
#   String#reverse method.

# palindrome_substrings method
# ============================
# - initialize a result variable to an empty array
# - create an array named substring_arr that contains all of the 
#   substrings of the input string that are at least 2 characters long
# - loop through the words in the substring_arr array.
# - if the word is a palindrome, append it to the result array
# - return the result array

def substring(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length -2_
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palidrom?(str)
  return str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << susbstring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []

