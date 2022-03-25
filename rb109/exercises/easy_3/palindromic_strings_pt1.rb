def palindrome?(string)
  string.reverse == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

def palindrome_arr?(array)
  array.reverse == array
end

puts
p palindrome_arr?(['d', 'a', 'd']) == true
p palindrome_arr?(['D', 'a', 'd']) == false

def palindrome_st_ar?(str_arr)
  str_arr.reverse == str_arr
end

puts
p palindrome_st_ar?('madam') == true
p palindrome_st_ar?('Madam') == false          # (case matters)
p palindrome_st_ar?("madam i'm adam") == false # (all characters matter)
p palindrome_st_ar?('356653') == true
p palindrome_st_ar?(['d', 'a', 'd']) == true
p palindrome_st_ar?(['D', 'a', 'd']) == false