SQFEET_TO_SQNCHES = 144
SQFEET_TO_SQCENTIMETERS = 929.03
ROUND = 2

puts "Enter the length of the room in feet:"
length_f = gets.chomp.to_i

puts "Enter the width of the room in feet:"
width_f = gets.chomp.to_i

area_f = (width_f * length_f).round(ROUND)
area_i = area_f * SQFEET_TO_SQNCHES
area_c = area_f * SQFEET_TO_SQCENTIMETERS

puts "The area of the room is #{area_f.round(ROUND)} square feet; 
      which is #{area_i.round(ROUND)} square inches; which is
      #{area_c.round(ROUND)} square centimeters"

