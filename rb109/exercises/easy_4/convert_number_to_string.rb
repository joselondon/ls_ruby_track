<<-exp
Write a method that takes a positive integer or zero,
and converts it to a string representation.

You may not use any of the standard conversion methods available 
in Ruby, such as Integer#to_s, String(), Kernel#format, etc.
Your method should do this the old-fashioned way and construct the
string by analyzing and manipulating the number.
exp

INTEGER_STRINGS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  str_int = ''
  loop do
    int, remainder = int.divmod(10)
    str_int.insert(0, INTEGER_STRINGS[remainder])
    break if int == 0
  end
  str_int
end

def signed_integer_to_string(int)
  unsigned = int.abs
  if int.negative?
    integer_to_string(unsigned).prepend('-')
  elsif int.positive?
    integer_to_string(unsigned).prepend('+')
  else
    integer_to_string(unsigned)
  end
end

p integer_to_string(4321)  == '4321'
p integer_to_string(0)  == '0'
p integer_to_string(5000)  == '5000'
p integer_to_string(235213132) == '235213132'
puts
puts 'signed_integer_to_string'
puts
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'