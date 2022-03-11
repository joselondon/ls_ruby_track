METERS_TO_FEET = 10.7639
ROUND = 2

puts "Enter the length of the room in meters:"
length = gets.chomp

puts "Enter the width of the room in meters:"
width = gets.chomp

area_m = length.to_i * width.to_i
area_f = (area_m * METERS_TO_FEET).round(ROUND)

puts "The area of the room is #{area_m} square meters
      (#{area_f} square feet)."
