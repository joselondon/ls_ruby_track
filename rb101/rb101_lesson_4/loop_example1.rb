loop do
  number = rand(1..10)
  puts 'Hello!'
  if number == 5
    puts 'exiting...'
    break
  end
end

# each iteration randomly generates a number between 1 and 10
# the string 'Hello' is displayed to screen
# provided the the randomly generated number does not equal 5
# the loop will run again

# end result is that the string 'Hello!' will be printed n times
# before finally displaying the string 'exiting' and breaking out
# of the loop