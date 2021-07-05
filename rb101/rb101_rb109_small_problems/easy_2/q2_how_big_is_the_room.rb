# PROBLEM:
# Build a program that asks a user for the length and width of a
# room in meters and then displays the area of the room in both 
# square meters and square feet. 
# Note: 1 square meter == 10.7639 square feet.

# IMPLIED RULES:
# 1. take length and width inputs with a text prompt
# 2. multiply length and width
# 4. convert from metres to feet using 1m sq = 10.7639 sq feet round reults to 2 places
# 5. Display metre and room areas to console 


# ALGORITHM:
# input: floats (length, width)
# output: float (sq_meters, sq_feet)

def room_size
  puts "Enter the length of the room in metres:"
  length = gets.to_f
  puts "Enter the width of the room in metres:"
  width = gets.to_f
  area_metres = (length * width).round(2)
  area_feet = (area_metres * 10.7639).round(2)
  puts "The area of the room is #{area_metres} square metres (#{area_feet} square feet)."
end

# EXAMPLE RUN:
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

room_size()