def short_long_short(str1, str2)
  if (str1.length <=> str2.length) == 1
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

puts short_long_short('abc', 'defgh')
puts short_long_short('abcde', 'fgh')
puts short_long_short('', 'xyz')