=begin
Write a method that takes a string with one or more space separated words and 
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.
=end

def word_sizes(string)
  count_hash = {}
  sizes_array = string.split.map { |word| word.length }

  sizes_array.each do |size|
    if count_hash.has_key?(size)
      next
    else
      count_hash[size] = sizes_array.count(size)
    end
  end

  count_hash.sort.to_h
end

=begin
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end
=end

p word_sizes('Four score and seven.')  == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?")  == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('')  == {}


