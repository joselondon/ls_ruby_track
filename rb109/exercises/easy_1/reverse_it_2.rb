def reverse_words(sentence)
  word_array = sentence.split
  word_array.map! do |word|
    word.length >= 5 ? word.reverse : word
  end
  word_array.join(' ')
end

puts reverse_words('Professional')          == 'lanoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School')         == 'hcnuaL loohcS'