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








