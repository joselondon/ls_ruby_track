def is_an_ip_number?(str)
  (1..255) === str
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop.to_i
    if is_an_ip_number?(word) == false
      return false
    end
  end
  return true
end



p dot_separated_ip_address?("10.254.1.1")