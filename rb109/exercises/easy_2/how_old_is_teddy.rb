puts "Hi, what's your name?"
name = gets.chomp
name = "Teddy" if name == ''
age = rand(20..200) 

puts "#{name} is #{age} years old!"