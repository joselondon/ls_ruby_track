require 'pry'
# Practice Problem 8

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = ['a', 'e', 'i', 'o', 'u']
hsh.each do |key, arr|
  arr.each do |str|
    str.chars.each {|char| puts char if vowels.include?(char)}
  end
end

