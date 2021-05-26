# original broken code

# limit = 15
# 
# def fib(first_num, second_num)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end
# 
# result = fib(0, 1)
# puts "result is #{result}"

# the limit variable is defined outside of #fib and
# #fib() cannot access any local variables defined outside 
# its scope.   limit can be made an addtional parameter of #fib()
# and passed when #fib() called.  See below:

# working code
limit = 15

def fib(limit, first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(limit, 0, 1)
puts "result is #{result}"

