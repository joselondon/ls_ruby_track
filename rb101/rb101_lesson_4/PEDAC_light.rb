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




# Algorithm:
#
# START WITH HIGH LEVEL ALGORITHM
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array

# WRITE CODE TO REFLECT HIGH LEVEL ALGORITHM
def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

# NOW WRITE ALGORITHM FOR THE NEW METHODS 
# STARTING WITH substring()

# To find a correct algorithm, you can simplify the problem by using a small, 
# concrete example to determine what we need to do.For instance, 
# you can start with a short word like halo and write all its 
# substrings that are at least 2 characters in length. 
# The resulting list is ['ha', 'hal', 'halo', 'al', 'alo', 'lo']

# substring() algorithm
# for each starting index from 0 through the next to last index position
#  for each substring length from 2 until there areno substrings of that length
#    extract the substring of the indicated length starting at the indicated index position
#  end of inner loop
# end of outer loop


# completed algorithm
# - create an empty array called `result` that will contain all required substrings
# - create a `starting_index` variable (value `0`) for the starting index of a substring
# - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#   - create a `num_chars` variable (value `2`) for the length of a substring
#   - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#     - extract a substring of length `num_chars` from `string` starting at `starting_index`
#     - append the extracted substring to the `result` array
#     - increment the `num_chars` variable by `1`
#   - end the inner loop
#   - increment the `starting_index` variable by `1`
# - end the outer loop
# - return the `result` array






