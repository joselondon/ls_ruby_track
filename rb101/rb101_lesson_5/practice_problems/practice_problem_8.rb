# Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

require 'pry'
hsh.each do |key, array|
  array.each do |word|
    word.split('').each do |letter|
      p letter if ['a', 'e', 'i', 'o', 'u'].include?(letter)
    end
  end
end
