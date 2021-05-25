# q1

10.times { |i| puts "The Flintstones rock!".rjust(21 + i) }
#-----------------------------------------------------------

# q2
# puts "the value of 40 + 2 is " + (40 + 2)
# error becasue you cannot concatenate a string with
# an integer - (40 + 2) results in an integer
# two possible solutions below:-
puts "the value of 40 + 2 is " + (40 + 2).to_s
# or
puts "the value of 40 + 2 is #{40 + 2}"
#----------------------------------------------------------------
