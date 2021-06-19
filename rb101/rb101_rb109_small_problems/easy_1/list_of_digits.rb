# inputs: integer
# output: array
# 
# rules:
# 1.  Integer will be +ve
# 2.  Question:  Should method check for validintegers above 0?
#     given the examples below for now will assume method will always
#     be passed a valid +ve integer
# 3.  Given an integer (int)
#   3a.  split the integer into separtate digits
# 4.  Return an array of each digit in the integer as separate elements.

def digit_list(int)
  int.to_s.split('').map {|str| str.to_i}
end


# examples/tests:
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true