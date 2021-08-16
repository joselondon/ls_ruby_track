require 'pry'
def remove_evens!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  binding.pry
  arr
end

remove_evens!([1,2,3,4,5,6])