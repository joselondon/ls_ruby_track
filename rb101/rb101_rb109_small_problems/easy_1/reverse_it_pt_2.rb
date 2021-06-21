# problem:
# Write a method that takes one argument,a string containing one or more words, 
# and returns the given string with words that contain five or more characters reversed. 
# Each string will consist of only letters and spaces. Spaces should be included 
# only when more than one word is present.

# Rules:
# 1.  given a string of two or more words
# 2.  return a stringwith words of more than five characters reveresd.
# 3.  each string will only considt of letters and spaces.
# 4.  spaces should only be included when more than one word is present
# 
# implied rules:
# 1.  words are defined as strings separated by white space, dictionary words not required
# 2.  trailing white space will not be included in the return string
# 3.  strings containing only white space will return an empty string
# 4.  empty strings will return an empty string

# Algorithm
# 1. given a String
# 2. separate each 'word' using single character white space as a separator
# 3. find those words of length 5 or greater
# 4. reverse the order of those words 
# 5. join the reveresed words back into a string using single white spaces as separators
# 6. return the reveresed string

def reverse_words(str)
  str = str.split
  count = 0
  while count < str.length
    str[count].length >= 5 ? str[count].reverse! : str[count]
    count += 1
  end
  str.join(' ')
end

# examples/tests
puts reverse_words('Professional')            # => lanoisseforP
puts reverse_words('Walk around the block')   # => Walk dnuora the kcolb
puts reverse_words('Launch School')           # => hcnuaL loohcS
puts reverse_words('')                        # => ''
puts reverse_words('         ')               # => ''
puts reverse_words(' walk around the block ') # => Walk dnuora the kcolb