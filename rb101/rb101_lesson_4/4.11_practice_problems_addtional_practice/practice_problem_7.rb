# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# ALGORITHM

# extract unique characters and the iterate over that list to count occurence
# of each char

letters = statement.delete(' ').chars.uniq
letter_count_hash = {}

letters.each do |letter|
  letter_count = statement.count(letter)
  letter_count_hash[letter] = letter_count
end

p letter_count_hash