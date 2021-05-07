# regex needs to retun a match where a string representation of a number is greater than zero and not a float

regex = /\A[1-9]\d*$\Z/

puts "'1' should equate to true"
p !!regex.match('1')  
puts
puts "'0' should equate to false"
p !!regex.match('0')
puts
puts "'-1' should equate to false"
p !!regex.match('-1')
puts
puts "'2.4' should equate to false"
p !!regex.match('2.4')
