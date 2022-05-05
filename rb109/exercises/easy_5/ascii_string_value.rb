def ascii_value(str)
  str.chars.inject(0) {|sum, char| sum += char.ord}
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# further discussion

p 'a'.ord.chr

# called on longer strings String#ord.chr will return the ascii string value of the first character.
# i.e in the case of 'abcde'.ord the return value will be 97 (the acscii value of 'a').