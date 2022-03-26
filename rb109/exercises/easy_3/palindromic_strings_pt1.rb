require 'pry'

def palindrome?(string)
  string.reverse == string
end

# 
# def palindrome_arr?(array)
#   array.reverse == array
# end
# 
# puts
# p palindrome_arr?(['d', 'a', 'd']) == true
# p palindrome_arr?(['D', 'a', 'd']) == false
# 
# def palindrome_st_ar?(str_arr)
#   str_arr.reverse == str_arr
# end
# 
# puts
# p palindrome_st_ar?('madam') == true
# p palindrome_st_ar?('Madam') == false          # (case matters)
# p palindrome_st_ar?("madam i'm adam") == false # (all characters matter)
# p palindrome_st_ar?('356653') == true
# p palindrome_st_ar?(['d', 'a', 'd']) == true
# p palindrome_st_ar?(['D', 'a', 'd']) == false

def string_or_array(str_arr)
  str_arr.is_a?(String) ? :str : :arr
end

def real_palindrome?(str_arr)
  chars = ('a'..'z').to_a + (0..9).to_a
  if string_or_array(str_arr) == :str
    new_obj = str_arr.downcase
    new_obj.each_char do |char| 
      new_obj.delete!(char) if !(chars.include?(char))
    end
  else
    new_obj = []
    str_arr.each do |char| 
      new_obj << char.downcase if chars.include?(char)
    end
  end
    palindrome?(new_obj)
end

puts
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false