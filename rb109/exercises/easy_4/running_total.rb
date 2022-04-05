require 'pry'
def running_total(arr)
  new_arr = []
  indx = 0
  new_arr[indx] = arr[indx]
  arr.each_with_index do |e, i|
    if i != arr.length
      new_arr << e + arr[i+1]
    end
  end
  new_arr
end

p running_total([2, 5, 13])

