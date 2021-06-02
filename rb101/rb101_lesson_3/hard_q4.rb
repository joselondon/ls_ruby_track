def is_an_ip_number?(str)
  (1..255) === str.to_i
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end



p dot_separated_ip_address?("10000.1.500.100sdasd0")