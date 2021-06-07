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
# - start a loop tha iterates over 'starting_index' from '0' to th elength of the string minus 2
#   - create a 'num_chars' variable (value '2')  for the length of a substring
#   - start an inner loop that iterates over 'num_chars' from '2' to 'string.length -starting_index'
#     - extract asubstring of length 'num_chars' from 'string' starting at 'starting_index'
#     - append the extracted substring to the 'result' array
#     - increment the 'num_chars' variable by '1'
#   - end the inner loop
#   - increment the 'starting_index' variable by '1'
# - end the outer loop
# - return the 'result' array

# ============================================================================================
# Optional step could be to turn this into psuedocode: 
# ============================================================================================





