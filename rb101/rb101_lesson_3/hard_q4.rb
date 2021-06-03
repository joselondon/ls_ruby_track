
# my solution
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if (array_equals_4?(dot_separated_words) == false)

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop.to_i
    if is_an_ip_number?(word) == false
      return false
    end
  end
  
  true
end

p dot_separated_ip_address?("10.254.1.1")

# more elegant!
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end