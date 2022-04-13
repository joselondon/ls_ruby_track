def str_char_to_int(char)
  str_to_int_hash = {
    "0"=> 0, "1"=> 1, "2"=> 2, "3"=> 3, "4"=> 4,
    "5"=> 5, "6"=> 6, "7"=> 7, "8"=> 8, "9"=> 9,
    "a"=> 10, "b"=> 11, "c"=> 12, "d"=> 13, "e"=> 14, "f"=>15
  }
  str_to_int_hash[char]
end

def string_to_integer(str)
  str.downcase!
  str_arr = str.chars
  int = 0
  str_arr.map! {|char| str_char_to_int(char)}
  str_arr.reduce {|memo, int| memo*10 + int}
end

def hexadecimal_to_integer(str)
  str.downcase!
  str_arr = str.chars
  int = 0
  str_arr.map! {|char| str_char_to_int(char)}
  str_arr.reduce {|memo, int| memo*16 + int}
end

def strip_leading!(str)
  case str[0]
  when '-'
    str.delete('-')
  when '+'
    str.delete('+')
  else
    str
  end
end

def string_to_signed_integer(str)
  clean_str = strip_leading!(str)
  int = string_to_integer(clean_str)
  str[0] == '-' ? -int : int
end

p string_to_integer('4321')
p string_to_integer('570')
p hexadecimal_to_integer('4D9f')
puts
puts "Convert string to a Signed Number!"
puts

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100