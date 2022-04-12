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

p string_to_integer('4321')
p string_to_integer('570')
p hexadecimal_to_integer('4D9f')