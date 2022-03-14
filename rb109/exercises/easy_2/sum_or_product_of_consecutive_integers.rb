puts "Please enter an integer greater than 0"
int = gets.chomp.to_i

puts "Enter 's' to computute the sum, 'p' to compute the product."
operation = gets.chomp.downcase

sum = (1..int).inject(:+)
product = (1..int).inject(:*)

case operation
when 's'
  puts "The sum of the integers between 1 and #{int} is #{sum}."
when 'p'
  puts "The product of the integers between 1 and #{int} is #{product}."
end