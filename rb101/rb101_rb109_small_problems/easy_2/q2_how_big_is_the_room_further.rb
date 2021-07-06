# PROBLEM:
# Build a program that asks a user for the length and width of a
# room in feet and then displays the area of the room in  
# square feet, square inches and square centimetres. 
# Note: 1 square meter == 10.7639 square feet.

# IMPLIED RULES:
# 1. take length and width inputs with a text prompt
# 2. multiply length and width and store as area_feet
# 4. Convert from feet to inches - store in area_inches
# 5. Convert inches to centimetres using 1 inch = 2.54 cm - store in area_cm
# 6. Display area in sq feet, sq inches and sq cms



# ALGORITHM:
# input: floats (length, width)
# output: float (sq_meters, sq_feet)
INCHES_TO_CM = 6.452
def room_size
  puts "Enter the length of the room in feet:"
  length = gets.to_f
  puts "Enter the width of the room in feet:"
  width = gets.to_f
  area_feet = (length * width)
  area_inches = (area_feet * 144).round(2)
  area_cm = (area_inches * INCHES_TO_CM).round(2)
  puts "The area of the room is #{area_feet.round(2)} square feet (#{area_inches} square inches, #{area_cm} square cm)."
end

# EXAMPLE RUN:
# Enter the length of the room in feet:
# 10
# Enter the width of the room in feet:
# 7
# The area of the room is 70.0 square feet (10080.0 square inches, 65036.16 square cm).

room_size()