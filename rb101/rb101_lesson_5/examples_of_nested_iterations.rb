arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.each do |array|
  array.map! {|str| str.to_i}
end
p arr.sort!