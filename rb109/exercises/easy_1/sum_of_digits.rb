def sum(int)
  arr = int.to_s.chars.map do |str|
    str.to_i
  end
  arr.reduce(:+)
end

p sum(23) 
puts sum(496) == 19
puts sum(123_456_789) == 45