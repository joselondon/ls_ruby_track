# Write a program that will ask a user for an input of a word 
# or multiple words and give back the number of characters. 
# Spaces should not be counted as a character.

# EXAMPLES:
# 
# input1:
# Please write word or multiple words: walk
# 
# output1:
# There are 4 characters in "walk".
# 
# input2:
# Please write word or multiple words: walk, don't run.
# 
# output2:
# There are 13 characters in "walk, don't run".
require 'io/console'

print "Please write a word or multiple words:  " 
word_input = STDIN.gets.chomp

non_whitespace_chars_count = word_input.split.join.length

puts "There are #{non_whitespace_chars_count} characters in '#{word_input}'"