
colors = ['green', 'blue', 'purple', 'orange']
colors = 0 

loop do
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end

# =>
# "I'm the color green!"
# "I'm the color blue!"
# "I'm the color purple!"
# "I'm the color orange!"
