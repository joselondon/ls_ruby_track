require 'pry'
require 'pry-byebug'

arr = [['1', '8', '11'], ['2', '6', '13'], 
      ['2', '12', '15'], ['1', '8', '9']]


arr2 = arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    binding.pry
    num.to_i
  end
end
puts
p arr2











# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], 
# ["2", "12", "15"]]