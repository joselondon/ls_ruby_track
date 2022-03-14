puts (1..99).select {|int| int.even?}
puts

# another solution

integer = 1
loop do
  break if integer >= 100
    puts integer if integer % 2 == 0
    integer += 1
end