=begin
Write a method that takes a string argument and returns a new string that 
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze or
String#squeeze!.
=end

def crunch(string)
  deduped_arr = []
  str_arr = string.chars

  str_arr.each_with_index do |char, index|
    if str_arr.uniq.length == 1
      deduped_arr << str_arr.uniq
      break
    elsif char != str_arr[index-1]
        deduped_arr << char
    end
  end
  deduped_arr.flatten.join
end

p crunch('ddaaiillyy ddoouubbllee')  == 'daily double'
p crunch('4444abcabccba')  == '4abcabcba'
p crunch('ggggggggggggggg')  == 'g'
p crunch('a')  == 'a'
p crunch('')  == ''