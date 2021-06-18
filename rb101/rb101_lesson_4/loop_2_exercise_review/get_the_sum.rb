loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  puts answer == 4 ? break : "Wrong answer.  Try again!"
end

puts "That's correct!"