def stringy(num)
  str = '1'
  until str.length == num do
    str.chars.last == '1' ? str << '0' : str << '1'
  end
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'  