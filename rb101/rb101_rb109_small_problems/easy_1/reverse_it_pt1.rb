# input = String
# 
# output = String
# 
# problem/rules:
# given a String 
# return a String with words in reverse order
# 
# implied rules:
# 'word' is defined as any String bounded by a single whitespace (dictionary words not required)
# all characters retain their case on reversal
# an empty String will return an empty String
# spaces of any length (where no other characters are present) are allowed and will return an empty string

# Algorithm
# 1. given a String
# 2. separate each 'word' using single character white space as a separator
# 3. reverse the order of those words 
# 4. join the reveresed words back into a string using single white spaces as separators
# 5. return the reveresed string

def reverse_sentence(str)
  str.split.reverse.join(' ')
end

# examples/tests
puts reverse_sentence('Hello World')   == 'World Hello'
puts reverse_sentence('Reverse these words')   == 'words these Reverse'
puts reverse_sentence('')  == ''
puts reverse_sentence('    ')  == '' # Any number of spaces results in ''






