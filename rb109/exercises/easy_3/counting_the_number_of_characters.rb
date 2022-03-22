def get_words
  print "Please write word or multiple words: "
  words = gets.chomp
end

def calc_chars(words, except)
  words.chars.count {|char| char != except}
end

words = get_words
chars = calc_chars(words, " ")

puts "There are #{chars} characters in \"#{words}\"."

